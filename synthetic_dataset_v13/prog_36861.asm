; DESCRIPTION: Draws a black circle centered at (438, 97) with radius 31.
; PLAN: r0=438(x), r1=97(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 97
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
