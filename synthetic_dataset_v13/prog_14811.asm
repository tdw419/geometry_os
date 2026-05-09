; DESCRIPTION: Draws a black rectangle at (67, 155) with width 87 and height 47.
; PLAN: r0=67(x), r1=155(y), r2=87(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 155
LDI r2, 87
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
