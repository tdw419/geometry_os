; DESCRIPTION: Renders a blue box of size 107x119 starting at (41, 76).
; PLAN: r0=41(x), r1=76(y), r2=107(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 76
LDI r2, 107
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
