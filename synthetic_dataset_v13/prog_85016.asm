; DESCRIPTION: Draws a orange circle centered at (469, 152) with radius 41.
; PLAN: r0=469(x), r1=152(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 152
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
