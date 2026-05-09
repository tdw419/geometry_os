; DESCRIPTION: Draws a black circle centered at (67, 83) with radius 13.
; PLAN: r0=67(x), r1=83(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 83
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
