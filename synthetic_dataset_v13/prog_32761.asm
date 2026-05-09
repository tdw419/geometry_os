; DESCRIPTION: Renders a purple box of size 97x18 starting at (61, 118).
; PLAN: r0=61(x), r1=118(y), r2=97(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 118
LDI r2, 97
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
