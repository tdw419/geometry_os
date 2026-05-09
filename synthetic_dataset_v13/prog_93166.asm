; DESCRIPTION: Draws a magenta circle centered at (282, 146) with radius 67.
; PLAN: r0=282(x), r1=146(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 146
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
