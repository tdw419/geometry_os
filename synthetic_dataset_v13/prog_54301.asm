; DESCRIPTION: Draws a magenta circle centered at (157, 175) with radius 78.
; PLAN: r0=157(x), r1=175(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 175
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
