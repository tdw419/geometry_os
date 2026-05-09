; DESCRIPTION: Places a blue line segment connecting (484, 94) to (148, 222).
; PLAN: r0=484(x1), r1=94(y1), r2=148(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 94
LDI r2, 148
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
