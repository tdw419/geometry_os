; DESCRIPTION: Draws a black line from (132, 167) to (251, 83).
; PLAN: r0=132(x1), r1=167(y1), r2=251(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 167
LDI r2, 251
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
