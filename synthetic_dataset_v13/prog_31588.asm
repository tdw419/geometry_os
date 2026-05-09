; DESCRIPTION: Draws a blue circle centered at (436, 191) with radius 36.
; PLAN: r0=436(x), r1=191(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 191
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
