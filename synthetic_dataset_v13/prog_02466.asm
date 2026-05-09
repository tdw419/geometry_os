; DESCRIPTION: Draws a purple rectangle at (232, 106) with width 82 and height 67.
; PLAN: r0=232(x), r1=106(y), r2=82(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 106
LDI r2, 82
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
