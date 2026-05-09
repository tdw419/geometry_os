; DESCRIPTION: Draws a magenta circle centered at (132, 67) with radius 57.
; PLAN: r0=132(x), r1=67(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 67
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
