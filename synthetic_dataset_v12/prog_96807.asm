; DESCRIPTION: Renders a red box of size 37x17 starting at (7, 41).
; PLAN: r0=7(x), r1=41(y), r2=37(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 41
LDI r2, 37
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
