; DESCRIPTION: Renders a yellow box of size 38x119 starting at (20, 41).
; PLAN: r0=20(x), r1=41(y), r2=38(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 41
LDI r2, 38
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
