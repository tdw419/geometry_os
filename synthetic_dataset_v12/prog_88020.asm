; DESCRIPTION: Places a blue line segment connecting (96, 158) to (192, 110).
; PLAN: r0=96(x1), r1=158(y1), r2=192(x2), r3=110(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 158
LDI r2, 192
LDI r3, 110
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
