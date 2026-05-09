; DESCRIPTION: Draws a black circle centered at (324, 175) with radius 31.
; PLAN: r0=324(x), r1=175(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 175
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
