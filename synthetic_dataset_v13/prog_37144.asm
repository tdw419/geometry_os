; DESCRIPTION: Draws a black circle centered at (102, 119) with radius 76.
; PLAN: r0=102(x), r1=119(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 119
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
