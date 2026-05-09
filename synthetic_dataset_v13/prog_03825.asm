; DESCRIPTION: Draws a purple rectangle at (278, 144) with width 69 and height 90.
; PLAN: r0=278(x), r1=144(y), r2=69(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 144
LDI r2, 69
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
