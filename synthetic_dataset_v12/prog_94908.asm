; DESCRIPTION: Draws a purple rectangle at (226, 67) with width 92 and height 84.
; PLAN: r0=226(x), r1=67(y), r2=92(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 67
LDI r2, 92
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
