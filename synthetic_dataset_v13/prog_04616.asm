; DESCRIPTION: Draws a black circle centered at (130, 83) with radius 76.
; PLAN: r0=130(x), r1=83(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 83
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
