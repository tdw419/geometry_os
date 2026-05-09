; DESCRIPTION: Draws a purple rectangle at (247, 109) with width 105 and height 101.
; PLAN: r0=247(x), r1=109(y), r2=105(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 109
LDI r2, 105
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
