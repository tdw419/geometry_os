; DESCRIPTION: Draws a magenta circle centered at (113, 165) with radius 35.
; PLAN: r0=113(x), r1=165(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 165
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
