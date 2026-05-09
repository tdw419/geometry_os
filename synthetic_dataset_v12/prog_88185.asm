; DESCRIPTION: Draws a black circle centered at (195, 139) with radius 38.
; PLAN: r0=195(x), r1=139(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 139
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
