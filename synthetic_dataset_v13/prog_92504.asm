; DESCRIPTION: Draws a black circle centered at (299, 148) with radius 41.
; PLAN: r0=299(x), r1=148(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 299
LDI r1, 148
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
