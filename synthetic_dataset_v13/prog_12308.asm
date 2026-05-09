; DESCRIPTION: Renders a purple box of size 114x29 starting at (6, 99).
; PLAN: r0=6(x), r1=99(y), r2=114(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 99
LDI r2, 114
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
