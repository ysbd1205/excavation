#!/bin/bash
echo "Shellscript start"

cFarray=("0.3" "0.5" "0.7" "0.9")
cRFarray=("0.3" "0.5" "0.7" "0.9")

#loop
for i in `seq 0 1` ; do
    sed -i -e "18c\variable cF equal ${cFarray[i]}" in.r_yM150e6_ps2_cR2_d4000_r7.5
    for j in `seq 0 3` ; do
        sed -i -e "19c\variable cRF equal ${cRFarray[j]}" in.r_yM150e6_ps2_cR2_d4000_r7.5
            echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
            echo "cF${cFarray[i]}_cRF${cRFarray[j]}"
            echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        mpirun -np 2 lmp_auto < in.r_yM150e6_ps2_cR2_d4000_r7.5
    done
done

