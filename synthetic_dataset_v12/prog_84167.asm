; DESCRIPTION: Draws a purple rectangle at (248, 67) with width 69 and height 116.
; PLAN: r0=248(x), r1=67(y), r2=69(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 67
LDI r2, 69
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
