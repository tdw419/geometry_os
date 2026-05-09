; DESCRIPTION: Places a blue line segment connecting (142, 78) to (377, 40).
; PLAN: r0=142(x1), r1=78(y1), r2=377(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 78
LDI r2, 377
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
