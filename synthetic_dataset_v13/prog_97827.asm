; DESCRIPTION: Renders a yellow box of size 41x22 starting at (34, 81).
; PLAN: r0=34(x), r1=81(y), r2=41(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 81
LDI r2, 41
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
