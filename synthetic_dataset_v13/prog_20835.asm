; DESCRIPTION: Places a blue circle of radius 73 at center (364, 105).
; PLAN: r0=364(x), r1=105(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 105
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
