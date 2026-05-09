; DESCRIPTION: Draws a black circle centered at (338, 192) with radius 18.
; PLAN: r0=338(x), r1=192(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 192
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
