; DESCRIPTION: Renders a purple box of size 102x50 starting at (37, 41).
; PLAN: r0=37(x), r1=41(y), r2=102(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 41
LDI r2, 102
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
