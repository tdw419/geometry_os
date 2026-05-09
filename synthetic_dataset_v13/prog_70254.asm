; DESCRIPTION: Renders a yellow box of size 87x119 starting at (237, 41).
; PLAN: r0=237(x), r1=41(y), r2=87(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 41
LDI r2, 87
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
