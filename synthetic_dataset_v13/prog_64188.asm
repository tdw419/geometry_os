; DESCRIPTION: Draws a green circle centered at (436, 205) with radius 49.
; PLAN: r0=436(x), r1=205(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 205
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
