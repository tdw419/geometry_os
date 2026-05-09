; DESCRIPTION: Draws a magenta circle centered at (67, 164) with radius 66.
; PLAN: r0=67(x), r1=164(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 164
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
