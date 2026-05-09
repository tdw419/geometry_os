; DESCRIPTION: Draws a orange circle centered at (467, 143) with radius 41.
; PLAN: r0=467(x), r1=143(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 143
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
