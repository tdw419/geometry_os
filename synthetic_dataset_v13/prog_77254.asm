; DESCRIPTION: Draws a black circle centered at (245, 26) with radius 26.
; PLAN: r0=245(x), r1=26(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 26
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
