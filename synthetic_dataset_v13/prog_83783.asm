; DESCRIPTION: Draws a white circle centered at (56, 123) with radius 41.
; PLAN: r0=56(x), r1=123(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 123
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
