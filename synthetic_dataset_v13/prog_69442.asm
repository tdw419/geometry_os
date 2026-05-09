; DESCRIPTION: Renders a orange box of size 11x76 starting at (325, 41).
; PLAN: r0=325(x), r1=41(y), r2=11(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 41
LDI r2, 11
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
