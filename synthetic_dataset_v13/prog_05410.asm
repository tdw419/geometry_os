; DESCRIPTION: Draws a black circle centered at (192, 91) with radius 76.
; PLAN: r0=192(x), r1=91(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 91
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
