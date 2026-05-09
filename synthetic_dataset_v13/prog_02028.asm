; DESCRIPTION: Places a blue line segment connecting (139, 23) to (341, 129).
; PLAN: r0=139(x1), r1=23(y1), r2=341(x2), r3=129(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 23
LDI r2, 341
LDI r3, 129
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
