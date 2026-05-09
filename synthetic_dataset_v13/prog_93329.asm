; DESCRIPTION: Draws a magenta circle centered at (144, 157) with radius 55.
; PLAN: r0=144(x), r1=157(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 157
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
