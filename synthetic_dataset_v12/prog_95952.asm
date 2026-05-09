; DESCRIPTION: Renders a orange box of size 65x88 starting at (41, 56).
; PLAN: r0=41(x), r1=56(y), r2=65(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 56
LDI r2, 65
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
