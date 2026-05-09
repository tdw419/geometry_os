; DESCRIPTION: Draws a blue circle centered at (436, 97) with radius 47.
; PLAN: r0=436(x), r1=97(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 97
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
