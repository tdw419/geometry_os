; DESCRIPTION: Draws a orange circle centered at (348, 122) with radius 76.
; PLAN: r0=348(x), r1=122(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 122
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
