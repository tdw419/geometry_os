; DESCRIPTION: Draws a black circle centered at (67, 169) with radius 41.
; PLAN: r0=67(x), r1=169(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 169
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
