; DESCRIPTION: Renders a red box of size 55x41 starting at (41, 181).
; PLAN: r0=41(x), r1=181(y), r2=55(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 181
LDI r2, 55
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
