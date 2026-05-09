; DESCRIPTION: Draws a purple rectangle at (371, 113) with width 87 and height 69.
; PLAN: r0=371(x), r1=113(y), r2=87(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 113
LDI r2, 87
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
