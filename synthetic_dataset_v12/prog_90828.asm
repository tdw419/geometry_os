; DESCRIPTION: Renders a blue box of size 62x89 starting at (174, 41).
; PLAN: r0=174(x), r1=41(y), r2=62(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 41
LDI r2, 62
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
