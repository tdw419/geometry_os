; DESCRIPTION: Draws a purple rectangle at (287, 163) with width 114 and height 63.
; PLAN: r0=287(x), r1=163(y), r2=114(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 163
LDI r2, 114
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
