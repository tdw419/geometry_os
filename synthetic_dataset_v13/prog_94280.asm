; DESCRIPTION: Creates a blue circular shape at (163, 104) with radius 11.
; PLAN: r0=163(x), r1=104(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 104
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
