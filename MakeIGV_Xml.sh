# from someone

out_file="www"
# Print xml file:
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>" > $out_file
echo "<Session genome=\"hg19\" hasGeneTrack=\"true\" hasSequenceTrack=\"true\" locus=\"$gene_name\" path=\"$WINDOWS_HOME_DIR\\$out_file\" version=\"8\">" >> $out_file
echo "    <Resources>" >> $out_file
for wf in "${win_file_list[@]}"; do
    echo "        <Resource path=\""$wf"\"/>" >> $out_file
done
echo "    </Resources>" >> $out_file

echo "    <Panel height=\"393\" name=\"DataPanel\" width=\"1643\">" >> $out_file

for wf in "${win_file_list[@]}"; do
	if [[ $wf =~ SJ[A-Z]+[0-9]+ ]]; then
		name=${BASH_REMATCH[0]}
		echo "        <Track altColor=\"0,0,178\" autoScale=\"true\" clazz=\"org.broad.igv.track.DataSourceTrack\" color=\"0,0,178\" displayMode=\"COLLAPSED\" featureVisibilityWindow=\"-1\" fontSize=\"10\" id=\"$wf\" name=\"$name\" normalize=\"false\" renderer=\"BAR_CHART\" sortable=\"true\" visible=\"true\" windowFunction=\"mean\">" >> $out_file
		echo "          <DataRange baseline=\"0.0\" drawBaseline=\"true\" flipAxis=\"false\" maximum=\"944.0\" minimum=\"0.0\" type=\"LINEAR\"/>" >> $out_file
		echo "        </Track>"	>> $out_file
	fi
done

echo "    </Panel>"	>> $out_file
echo "    <Panel height=\"48\" name=\"FeaturePanel\" width=\"1643\">" >> $out_file
echo "        <Track altColor=\"0,0,178\" autoScale=\"false\" color=\"0,0,178\" displayMode=\"COLLAPSED\" featureVisibilityWindow=\"-1\" fontSize=\"10\" id=\"Reference sequence\" name=\"Reference sequence\" sortable=\"false\" visible=\"true\"/>" >> $out_file
echo "        <Track altColor=\"0,0,178\" autoScale=\"true\" clazz=\"org.broad.igv.track.FeatureTrack\" color=\"0,0,178\" colorScale=\"ContinuousColorScale;0.0;308.0;255,255,255;0,0,178\" displayMode=\"COLLAPSED\" featureVisibilityWindow=\"-1\" fontSize=\"10\" height=\"35\" id=\"hg19_genes\" name=\"RefSeq Genes\" renderer=\"BASIC_FEATURE\" sortable=\"false\" visible=\"true\" windowFunction=\"count\">" >> $out_file
echo "          <DataRange baseline=\"0.0\" drawBaseline=\"true\" flipAxis=\"false\" maximum=\"308.0\" minimum=\"0.0\" type=\"LINEAR\"/>"	>> $out_file
echo "        </Track>" >> $out_file
echo "    </Panel>"	>> $out_file
echo "    <PanelLayout dividerFractions=\"0.8816964285714286\"/>"	>> $out_file
echo "    <HiddenAttributes>"	>> $out_file
echo "        <Attribute name=\"DATA FILE\"/>"	>> $out_file
echo "        <Attribute name=\"DATA TYPE\"/>"	>> $out_file
echo "    </HiddenAttributes>"	>> $out_file
echo "</Session>"	>> $out_file
