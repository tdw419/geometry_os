; DESCRIPTION: Draws a purple line from (463, 155) to (185, 66).
; PLAN: r0=463(x1), r1=155(y1), r2=185(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 155
LDI r2, 185
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
