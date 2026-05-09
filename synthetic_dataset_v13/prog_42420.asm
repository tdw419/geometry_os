; DESCRIPTION: Creates a blue circular shape at (137, 75) with radius 37.
; PLAN: r0=137(x), r1=75(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 75
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
