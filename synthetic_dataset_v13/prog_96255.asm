; DESCRIPTION: Draws a purple rectangle at (134, 67) with width 15 and height 68.
; PLAN: r0=134(x), r1=67(y), r2=15(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 67
LDI r2, 15
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
