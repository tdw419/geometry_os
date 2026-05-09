; DESCRIPTION: Draws a blue circle centered at (436, 73) with radius 37.
; PLAN: r0=436(x), r1=73(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 73
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
