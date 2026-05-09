; DESCRIPTION: Creates a blue circular shape at (456, 201) with radius 11.
; PLAN: r0=456(x), r1=201(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 201
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
