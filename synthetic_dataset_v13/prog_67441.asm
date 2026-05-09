; DESCRIPTION: Draws a black circle centered at (221, 192) with radius 35.
; PLAN: r0=221(x), r1=192(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 192
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
