; DESCRIPTION: Renders a purple box of size 31x41 starting at (267, 145).
; PLAN: r0=267(x), r1=145(y), r2=31(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 145
LDI r2, 31
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
