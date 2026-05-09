; DESCRIPTION: Renders a orange box of size 41x28 starting at (118, 172).
; PLAN: r0=118(x), r1=172(y), r2=41(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 172
LDI r2, 41
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
