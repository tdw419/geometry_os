; DESCRIPTION: Draws a magenta circle centered at (379, 123) with radius 19.
; PLAN: r0=379(x), r1=123(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 123
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
