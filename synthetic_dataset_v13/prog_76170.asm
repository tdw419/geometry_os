; DESCRIPTION: Renders a blue box of size 41x119 starting at (237, 7).
; PLAN: r0=237(x), r1=7(y), r2=41(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 7
LDI r2, 41
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
