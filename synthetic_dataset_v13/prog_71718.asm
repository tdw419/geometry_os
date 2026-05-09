; DESCRIPTION: Draws a magenta circle centered at (104, 226) with radius 25.
; PLAN: r0=104(x), r1=226(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 226
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
