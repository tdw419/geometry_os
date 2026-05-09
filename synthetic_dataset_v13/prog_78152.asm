; DESCRIPTION: Draws a black circle centered at (364, 79) with radius 39.
; PLAN: r0=364(x), r1=79(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 79
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
