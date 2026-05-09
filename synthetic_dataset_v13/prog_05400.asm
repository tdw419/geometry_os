; DESCRIPTION: Draws a magenta circle centered at (261, 67) with radius 56.
; PLAN: r0=261(x), r1=67(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 67
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
