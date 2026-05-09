; DESCRIPTION: Draws a orange circle centered at (390, 169) with radius 41.
; PLAN: r0=390(x), r1=169(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 169
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
