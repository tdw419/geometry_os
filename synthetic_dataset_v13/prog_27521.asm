; DESCRIPTION: Creates a blue circular shape at (375, 201) with radius 15.
; PLAN: r0=375(x), r1=201(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 201
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
