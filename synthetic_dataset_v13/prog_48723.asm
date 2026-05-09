; DESCRIPTION: Draws a black circle centered at (371, 156) with radius 38.
; PLAN: r0=371(x), r1=156(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 156
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
