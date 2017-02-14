#this script first describes the script's usage and prevents the script from running if no filename is inputted. Next, the script chooses the filename entered  (parameter) as the first file specified. This prints the number of genes found in the script. To determine that number, the pipe reads the datafile, ignores the lines starting with pound signs since they are comments, and then chooses the third column. In this third column, the script finds lines containing (gene) and prints number of genes found in file.  
#!/bin/bash
#establishes usage for script and prompts user for filename if no filename input 
if [ $# -eq 0 ]; then #conditional statement for if the number of parameter (filename) passes and equals integer zero which prompts print command below 
echo "Usage: $0 filename" #print sentence describing usage directions
exit 1 #quits script if error
fi #quits script

filename=$1 #filename is the parameter for first file specified 
#prints the sentence in quotations below and outputs filename specified as a numerical character of matching number of genes
echo -n "The number of genes in $filename is " #appends output after sentence prints
cat $filename | # first command in pipe: read datafile ($filename) and input into second command
  grep -v '^#' | # second command in pipe -(invert selection of all lines starting with # sign)so you select lines that does not begin with a # sign 
  cut -f3 | # third command keep column 3 only
  grep gene | #fourth command find the string (gene)
  wc -l #fourth command list word count; since we want to see how many times gene shows up

