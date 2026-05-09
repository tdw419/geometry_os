; DESCRIPTION: Draws a magenta circle centered at (88, 139) with radius 10.
; PLAN: r0=88(x), r1=139(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 139
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
