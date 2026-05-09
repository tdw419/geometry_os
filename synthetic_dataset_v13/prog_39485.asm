; DESCRIPTION: Draws a magenta circle centered at (14, 191) with radius 14.
; PLAN: r0=14(x), r1=191(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 14
LDI r1, 191
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
