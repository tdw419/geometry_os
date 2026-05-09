; DESCRIPTION: Renders a orange box of size 41x14 starting at (389, 140).
; PLAN: r0=389(x), r1=140(y), r2=41(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 140
LDI r2, 41
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
