; DESCRIPTION: Renders a red box of size 66x34 starting at (335, 41).
; PLAN: r0=335(x), r1=41(y), r2=66(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 41
LDI r2, 66
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
