; DESCRIPTION: Renders a orange box of size 78x41 starting at (119, 57).
; PLAN: r0=119(x), r1=57(y), r2=78(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 57
LDI r2, 78
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
