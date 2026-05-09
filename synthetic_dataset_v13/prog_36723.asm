; DESCRIPTION: Draws a orange circle centered at (41, 73) with radius 25.
; PLAN: r0=41(x), r1=73(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 73
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
