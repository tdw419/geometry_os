; DESCRIPTION: Draws a purple line from (112, 81) to (158, 159).
; PLAN: r0=112(x1), r1=81(y1), r2=158(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 81
LDI r2, 158
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
