; DESCRIPTION: Renders a orange box of size 41x109 starting at (430, 36).
; PLAN: r0=430(x), r1=36(y), r2=41(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 36
LDI r2, 41
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
