; DESCRIPTION: Places a blue line segment connecting (341, 14) to (1, 155).
; PLAN: r0=341(x1), r1=14(y1), r2=1(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 14
LDI r2, 1
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
