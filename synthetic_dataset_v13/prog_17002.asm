; DESCRIPTION: Draws a black circle centered at (110, 194) with radius 41.
; PLAN: r0=110(x), r1=194(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 194
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
