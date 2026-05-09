; DESCRIPTION: Draws a black circle centered at (245, 156) with radius 11.
; PLAN: r0=245(x), r1=156(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 156
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
