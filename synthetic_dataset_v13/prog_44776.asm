; DESCRIPTION: Draws a black circle centered at (178, 75) with radius 49.
; PLAN: r0=178(x), r1=75(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 75
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
