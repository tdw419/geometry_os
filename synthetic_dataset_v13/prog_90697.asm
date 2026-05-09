; DESCRIPTION: Renders a green box of size 78x34 starting at (424, 41).
; PLAN: r0=424(x), r1=41(y), r2=78(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 41
LDI r2, 78
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
