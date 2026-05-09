; DESCRIPTION: Renders a orange box of size 52x58 starting at (155, 41).
; PLAN: r0=155(x), r1=41(y), r2=52(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 41
LDI r2, 52
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
