; DESCRIPTION: Renders a blue box of size 88x53 starting at (41, 114).
; PLAN: r0=41(x), r1=114(y), r2=88(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 114
LDI r2, 88
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
