; DESCRIPTION: Draws a green circle centered at (269, 199) with radius 53.
; PLAN: r0=269(x), r1=199(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 199
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
