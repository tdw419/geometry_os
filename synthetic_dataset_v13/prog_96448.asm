; DESCRIPTION: Draws a black circle centered at (156, 49) with radius 14.
; PLAN: r0=156(x), r1=49(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 49
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
