; DESCRIPTION: Draws a purple rectangle at (150, 163) with width 26 and height 39.
; PLAN: r0=150(x), r1=163(y), r2=26(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 163
LDI r2, 26
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
