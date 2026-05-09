; DESCRIPTION: Renders a black box of size 62x39 starting at (41, 58).
; PLAN: r0=41(x), r1=58(y), r2=62(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 58
LDI r2, 62
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
