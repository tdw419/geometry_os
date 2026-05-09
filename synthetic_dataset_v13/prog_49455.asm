; DESCRIPTION: Renders a purple box of size 114x114 starting at (194, 78).
; PLAN: r0=194(x), r1=78(y), r2=114(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 78
LDI r2, 114
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
