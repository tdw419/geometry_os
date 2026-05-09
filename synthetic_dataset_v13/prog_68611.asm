; DESCRIPTION: Draws a magenta circle centered at (212, 101) with radius 76.
; PLAN: r0=212(x), r1=101(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 101
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
