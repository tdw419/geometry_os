; DESCRIPTION: Draws a black circle centered at (238, 30) with radius 15.
; PLAN: r0=238(x), r1=30(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 30
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
