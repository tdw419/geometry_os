; DESCRIPTION: Renders a purple box of size 41x89 starting at (396, 127).
; PLAN: r0=396(x), r1=127(y), r2=41(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 127
LDI r2, 41
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
