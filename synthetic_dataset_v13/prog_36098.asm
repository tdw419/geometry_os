; DESCRIPTION: Renders a green box of size 58x49 starting at (358, 41).
; PLAN: r0=358(x), r1=41(y), r2=58(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 41
LDI r2, 58
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
