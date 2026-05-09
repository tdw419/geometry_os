; DESCRIPTION: Draws a orange circle centered at (378, 112) with radius 41.
; PLAN: r0=378(x), r1=112(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 112
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
