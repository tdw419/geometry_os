; DESCRIPTION: Draws a magenta circle centered at (371, 67) with radius 67.
; PLAN: r0=371(x), r1=67(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 67
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
