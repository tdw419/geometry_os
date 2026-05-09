; DESCRIPTION: Draws a black circle centered at (191, 165) with radius 75.
; PLAN: r0=191(x), r1=165(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 165
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
