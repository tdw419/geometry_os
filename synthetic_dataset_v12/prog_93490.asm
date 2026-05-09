; DESCRIPTION: Draws a magenta circle centered at (367, 101) with radius 74.
; PLAN: r0=367(x), r1=101(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 101
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
