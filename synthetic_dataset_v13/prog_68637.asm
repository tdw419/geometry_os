; DESCRIPTION: Draws a magenta circle centered at (203, 165) with radius 60.
; PLAN: r0=203(x), r1=165(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 165
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
