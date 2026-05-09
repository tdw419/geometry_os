; DESCRIPTION: Renders a purple box of size 114x78 starting at (279, 123).
; PLAN: r0=279(x), r1=123(y), r2=114(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 123
LDI r2, 114
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
