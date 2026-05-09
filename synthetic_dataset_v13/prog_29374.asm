; DESCRIPTION: Draws a purple line from (185, 24) to (62, 116).
; PLAN: r0=185(x1), r1=24(y1), r2=62(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 24
LDI r2, 62
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
