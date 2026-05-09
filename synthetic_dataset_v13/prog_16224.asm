; DESCRIPTION: Draws a black line from (51, 115) to (251, 211).
; PLAN: r0=51(x1), r1=115(y1), r2=251(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 115
LDI r2, 251
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
