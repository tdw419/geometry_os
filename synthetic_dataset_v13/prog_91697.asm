; DESCRIPTION: Draws a orange circle centered at (167, 46) with radius 41.
; PLAN: r0=167(x), r1=46(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 46
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
