; DESCRIPTION: Draws a black circle centered at (383, 119) with radius 17.
; PLAN: r0=383(x), r1=119(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 119
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
