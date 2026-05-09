; DESCRIPTION: Draws a purple rectangle at (334, 166) with width 99 and height 47.
; PLAN: r0=334(x), r1=166(y), r2=99(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 166
LDI r2, 99
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
