; DESCRIPTION: Draws a magenta circle centered at (130, 191) with radius 20.
; PLAN: r0=130(x), r1=191(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 191
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
