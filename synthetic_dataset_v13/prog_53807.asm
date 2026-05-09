; DESCRIPTION: Renders a orange box of size 85x41 starting at (73, 21).
; PLAN: r0=73(x), r1=21(y), r2=85(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 21
LDI r2, 85
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
