; DESCRIPTION: Draws a magenta circle centered at (430, 48) with radius 43.
; PLAN: r0=430(x), r1=48(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 48
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
