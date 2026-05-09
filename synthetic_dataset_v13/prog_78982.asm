; DESCRIPTION: Draws a green circle centered at (478, 59) with radius 33.
; PLAN: r0=478(x), r1=59(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 59
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
