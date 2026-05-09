; DESCRIPTION: Draws a black circle centered at (90, 102) with radius 41.
; PLAN: r0=90(x), r1=102(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 102
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
