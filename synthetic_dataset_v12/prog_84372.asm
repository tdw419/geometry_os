; DESCRIPTION: Places a blue line segment connecting (164, 136) to (110, 250).
; PLAN: r0=164(x1), r1=136(y1), r2=110(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 136
LDI r2, 110
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
