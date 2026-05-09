; DESCRIPTION: Draws a purple line from (155, 153) to (269, 189).
; PLAN: r0=155(x1), r1=153(y1), r2=269(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 153
LDI r2, 269
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
