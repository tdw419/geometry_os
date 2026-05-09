; DESCRIPTION: Draws a orange circle centered at (217, 57) with radius 41.
; PLAN: r0=217(x), r1=57(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 57
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
