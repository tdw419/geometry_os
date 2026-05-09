; DESCRIPTION: Draws a purple rectangle at (114, 86) with width 67 and height 66.
; PLAN: r0=114(x), r1=86(y), r2=67(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 86
LDI r2, 67
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
