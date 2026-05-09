; DESCRIPTION: Draws a purple rectangle at (337, 163) with width 65 and height 68.
; PLAN: r0=337(x), r1=163(y), r2=65(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 163
LDI r2, 65
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
