; DESCRIPTION: Renders a purple box of size 98x119 starting at (377, 114).
; PLAN: r0=377(x), r1=114(y), r2=98(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 114
LDI r2, 98
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
