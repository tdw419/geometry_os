; DESCRIPTION: Renders a red box of size 108x96 starting at (95, 41).
; PLAN: r0=95(x), r1=41(y), r2=108(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 41
LDI r2, 108
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
