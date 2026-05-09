; DESCRIPTION: Renders a purple box of size 81x107 starting at (389, 114).
; PLAN: r0=389(x), r1=114(y), r2=81(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 114
LDI r2, 81
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
