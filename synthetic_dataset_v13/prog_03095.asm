; DESCRIPTION: Renders a purple box of size 35x58 starting at (86, 118).
; PLAN: r0=86(x), r1=118(y), r2=35(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 118
LDI r2, 35
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
