; DESCRIPTION: Draws a magenta circle centered at (291, 123) with radius 14.
; PLAN: r0=291(x), r1=123(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 123
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
