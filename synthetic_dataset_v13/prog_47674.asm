; DESCRIPTION: Draws a purple rectangle at (178, 131) with width 84 and height 69.
; PLAN: r0=178(x), r1=131(y), r2=84(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 131
LDI r2, 84
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
