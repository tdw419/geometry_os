; DESCRIPTION: Renders a blue box of size 91x63 starting at (43, 41).
; PLAN: r0=43(x), r1=41(y), r2=91(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 41
LDI r2, 91
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
