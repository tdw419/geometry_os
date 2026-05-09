; DESCRIPTION: Draws a purple rectangle at (261, 51) with width 67 and height 98.
; PLAN: r0=261(x), r1=51(y), r2=67(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 51
LDI r2, 67
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
