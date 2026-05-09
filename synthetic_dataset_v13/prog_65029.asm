; DESCRIPTION: Renders a purple box of size 73x98 starting at (155, 137).
; PLAN: r0=155(x), r1=137(y), r2=73(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 137
LDI r2, 73
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
