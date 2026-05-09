; DESCRIPTION: Draws a magenta circle centered at (310, 67) with radius 15.
; PLAN: r0=310(x), r1=67(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 67
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
