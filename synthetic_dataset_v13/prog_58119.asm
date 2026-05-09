; DESCRIPTION: Draws a purple rectangle at (482, 116) with width 26 and height 49.
; PLAN: r0=482(x), r1=116(y), r2=26(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 116
LDI r2, 26
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
