; DESCRIPTION: Draws a green circle centered at (436, 191) with radius 39.
; PLAN: r0=436(x), r1=191(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 191
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
