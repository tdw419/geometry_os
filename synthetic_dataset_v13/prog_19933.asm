; DESCRIPTION: Places a blue line segment connecting (435, 198) to (325, 109).
; PLAN: r0=435(x1), r1=198(y1), r2=325(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 198
LDI r2, 325
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
