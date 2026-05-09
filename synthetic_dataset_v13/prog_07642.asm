; DESCRIPTION: Draws a purple rectangle at (172, 11) with width 101 and height 48.
; PLAN: r0=172(x), r1=11(y), r2=101(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 11
LDI r2, 101
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
