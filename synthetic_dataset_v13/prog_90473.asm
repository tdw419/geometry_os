; DESCRIPTION: Draws a magenta circle centered at (316, 45) with radius 31.
; PLAN: r0=316(x), r1=45(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 45
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
