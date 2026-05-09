; DESCRIPTION: Draws a black circle centered at (283, 137) with radius 80.
; PLAN: r0=283(x), r1=137(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 137
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
