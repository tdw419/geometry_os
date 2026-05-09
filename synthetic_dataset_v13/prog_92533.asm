; DESCRIPTION: Draws a purple line from (51, 106) to (366, 12).
; PLAN: r0=51(x1), r1=106(y1), r2=366(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 106
LDI r2, 366
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
