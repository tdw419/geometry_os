; DESCRIPTION: Places a purple line segment connecting (105, 133) to (188, 232).
; PLAN: r0=105(x1), r1=133(y1), r2=188(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 133
LDI r2, 188
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
