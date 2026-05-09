; DESCRIPTION: Draws a black circle centered at (297, 56) with radius 53.
; PLAN: r0=297(x), r1=56(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 56
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
