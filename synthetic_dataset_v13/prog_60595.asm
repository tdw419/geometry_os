; DESCRIPTION: Draws a purple rectangle at (162, 69) with width 39 and height 92.
; PLAN: r0=162(x), r1=69(y), r2=39(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 69
LDI r2, 39
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
