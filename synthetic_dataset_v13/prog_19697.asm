; DESCRIPTION: Draws a black circle centered at (156, 76) with radius 18.
; PLAN: r0=156(x), r1=76(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 76
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
