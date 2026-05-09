; DESCRIPTION: Renders a purple box of size 41x45 starting at (427, 81).
; PLAN: r0=427(x), r1=81(y), r2=41(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 81
LDI r2, 41
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
