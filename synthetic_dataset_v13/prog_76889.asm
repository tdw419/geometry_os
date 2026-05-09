; DESCRIPTION: Draws a black circle centered at (439, 77) with radius 69.
; PLAN: r0=439(x), r1=77(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 77
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
