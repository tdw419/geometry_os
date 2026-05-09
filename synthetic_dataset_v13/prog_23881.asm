; DESCRIPTION: Renders a orange box of size 18x41 starting at (161, 33).
; PLAN: r0=161(x), r1=33(y), r2=18(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 33
LDI r2, 18
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
