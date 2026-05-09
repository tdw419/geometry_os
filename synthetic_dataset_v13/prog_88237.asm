; DESCRIPTION: Draws a purple rectangle at (79, 166) with width 28 and height 69.
; PLAN: r0=79(x), r1=166(y), r2=28(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 166
LDI r2, 28
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
