; DESCRIPTION: Renders a orange box of size 19x45 starting at (41, 118).
; PLAN: r0=41(x), r1=118(y), r2=19(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 118
LDI r2, 19
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
