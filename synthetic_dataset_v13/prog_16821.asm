; DESCRIPTION: Places a blue line segment connecting (238, 192) to (496, 137).
; PLAN: r0=238(x1), r1=192(y1), r2=496(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 192
LDI r2, 496
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
