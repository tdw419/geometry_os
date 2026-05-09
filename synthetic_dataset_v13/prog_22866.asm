; DESCRIPTION: Places a black line segment connecting (133, 139) to (84, 20).
; PLAN: r0=133(x1), r1=139(y1), r2=84(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 139
LDI r2, 84
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
