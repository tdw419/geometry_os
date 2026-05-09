; DESCRIPTION: Renders a orange box of size 66x41 starting at (100, 75).
; PLAN: r0=100(x), r1=75(y), r2=66(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 75
LDI r2, 66
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
