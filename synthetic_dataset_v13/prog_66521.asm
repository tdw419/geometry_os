; DESCRIPTION: Draws a black circle centered at (439, 157) with radius 43.
; PLAN: r0=439(x), r1=157(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 157
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
