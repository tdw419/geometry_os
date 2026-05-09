; DESCRIPTION: Draws a black circle centered at (49, 75) with radius 45.
; PLAN: r0=49(x), r1=75(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 75
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
