; DESCRIPTION: Draws a purple rectangle at (412, 133) with width 10 and height 69.
; PLAN: r0=412(x), r1=133(y), r2=10(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 133
LDI r2, 10
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
