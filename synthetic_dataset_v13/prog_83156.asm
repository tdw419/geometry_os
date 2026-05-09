; DESCRIPTION: Draws a purple rectangle at (99, 163) with width 105 and height 47.
; PLAN: r0=99(x), r1=163(y), r2=105(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 163
LDI r2, 105
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
