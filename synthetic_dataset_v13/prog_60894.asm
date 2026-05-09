; DESCRIPTION: Draws a purple line from (306, 43) to (174, 107).
; PLAN: r0=306(x1), r1=43(y1), r2=174(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 43
LDI r2, 174
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
