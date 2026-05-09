; DESCRIPTION: Draws a purple rectangle at (230, 55) with width 69 and height 75.
; PLAN: r0=230(x), r1=55(y), r2=69(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 55
LDI r2, 69
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
