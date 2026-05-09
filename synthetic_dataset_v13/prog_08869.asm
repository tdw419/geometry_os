; DESCRIPTION: Renders a orange box of size 85x41 starting at (7, 166).
; PLAN: r0=7(x), r1=166(y), r2=85(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 166
LDI r2, 85
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
