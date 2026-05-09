; DESCRIPTION: Places a blue line segment connecting (472, 136) to (54, 158).
; PLAN: r0=472(x1), r1=136(y1), r2=54(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 136
LDI r2, 54
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
