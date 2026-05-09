; DESCRIPTION: Draws a magenta circle centered at (155, 164) with radius 64.
; PLAN: r0=155(x), r1=164(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 164
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
