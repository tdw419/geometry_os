; DESCRIPTION: Renders a orange box of size 112x41 starting at (20, 170).
; PLAN: r0=20(x), r1=170(y), r2=112(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 170
LDI r2, 112
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
