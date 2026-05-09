; DESCRIPTION: Draws a black circle centered at (269, 156) with radius 20.
; PLAN: r0=269(x), r1=156(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 156
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
