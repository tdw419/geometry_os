; DESCRIPTION: Draws a purple rectangle at (334, 63) with width 28 and height 14.
; PLAN: r0=334(x), r1=63(y), r2=28(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 63
LDI r2, 28
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
