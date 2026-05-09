; DESCRIPTION: Renders a purple box of size 93x114 starting at (6, 26).
; PLAN: r0=6(x), r1=26(y), r2=93(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 26
LDI r2, 93
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
