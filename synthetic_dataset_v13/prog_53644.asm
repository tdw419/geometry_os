; DESCRIPTION: Places a blue line segment connecting (84, 94) to (22, 176).
; PLAN: r0=84(x1), r1=94(y1), r2=22(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 94
LDI r2, 22
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
