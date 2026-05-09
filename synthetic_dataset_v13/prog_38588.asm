; DESCRIPTION: Places a purple line segment connecting (188, 94) to (437, 136).
; PLAN: r0=188(x1), r1=94(y1), r2=437(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 94
LDI r2, 437
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
