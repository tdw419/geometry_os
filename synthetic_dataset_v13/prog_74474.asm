; DESCRIPTION: Draws a purple rectangle at (165, 131) with width 97 and height 69.
; PLAN: r0=165(x), r1=131(y), r2=97(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 131
LDI r2, 97
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
