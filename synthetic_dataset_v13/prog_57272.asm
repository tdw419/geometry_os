; DESCRIPTION: Draws a magenta circle centered at (263, 203) with radius 14.
; PLAN: r0=263(x), r1=203(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 203
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
