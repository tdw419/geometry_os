; DESCRIPTION: Draws a orange circle centered at (338, 60) with radius 41.
; PLAN: r0=338(x), r1=60(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 60
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
