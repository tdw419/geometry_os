; DESCRIPTION: Places a blue line segment connecting (137, 136) to (389, 216).
; PLAN: r0=137(x1), r1=136(y1), r2=389(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 136
LDI r2, 389
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
