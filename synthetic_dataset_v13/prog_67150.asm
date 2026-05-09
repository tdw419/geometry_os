; DESCRIPTION: Draws a purple line from (334, 200) to (62, 148).
; PLAN: r0=334(x1), r1=200(y1), r2=62(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 200
LDI r2, 62
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
