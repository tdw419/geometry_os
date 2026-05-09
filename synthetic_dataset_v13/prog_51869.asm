; DESCRIPTION: Renders a purple box of size 81x28 starting at (101, 185).
; PLAN: r0=101(x), r1=185(y), r2=81(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 185
LDI r2, 81
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
