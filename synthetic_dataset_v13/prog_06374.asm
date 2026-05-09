; DESCRIPTION: Draws a magenta circle centered at (182, 101) with radius 33.
; PLAN: r0=182(x), r1=101(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 101
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
