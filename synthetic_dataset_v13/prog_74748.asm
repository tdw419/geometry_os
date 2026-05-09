; DESCRIPTION: Draws a black circle centered at (99, 114) with radius 62.
; PLAN: r0=99(x), r1=114(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 114
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
