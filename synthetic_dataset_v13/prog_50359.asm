; DESCRIPTION: Draws a black circle centered at (316, 177) with radius 75.
; PLAN: r0=316(x), r1=177(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 177
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
