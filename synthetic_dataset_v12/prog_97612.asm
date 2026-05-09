; DESCRIPTION: Places a blue line segment connecting (314, 130) to (282, 79).
; PLAN: r0=314(x1), r1=130(y1), r2=282(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 130
LDI r2, 282
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
