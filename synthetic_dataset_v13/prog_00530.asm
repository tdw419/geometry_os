; DESCRIPTION: Draws a black circle centered at (436, 65) with radius 35.
; PLAN: r0=436(x), r1=65(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 65
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
