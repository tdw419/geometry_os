; DESCRIPTION: Creates a blue circular shape at (137, 163) with radius 30.
; PLAN: r0=137(x), r1=163(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 163
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
