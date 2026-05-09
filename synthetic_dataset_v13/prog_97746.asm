; DESCRIPTION: Draws a black circle centered at (185, 99) with radius 43.
; PLAN: r0=185(x), r1=99(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 99
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
