; DESCRIPTION: Renders a black box of size 41x118 starting at (459, 68).
; PLAN: r0=459(x), r1=68(y), r2=41(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 68
LDI r2, 41
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
