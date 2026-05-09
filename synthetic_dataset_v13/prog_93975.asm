; DESCRIPTION: Places a blue line segment connecting (440, 15) to (390, 105).
; PLAN: r0=440(x1), r1=15(y1), r2=390(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 15
LDI r2, 390
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
