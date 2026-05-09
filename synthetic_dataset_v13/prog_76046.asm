; DESCRIPTION: Draws a black rectangle at (114, 81) with width 67 and height 84.
; PLAN: r0=114(x), r1=81(y), r2=67(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 81
LDI r2, 67
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
