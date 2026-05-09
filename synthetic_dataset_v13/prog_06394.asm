; DESCRIPTION: Draws a magenta circle centered at (329, 123) with radius 73.
; PLAN: r0=329(x), r1=123(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 123
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
