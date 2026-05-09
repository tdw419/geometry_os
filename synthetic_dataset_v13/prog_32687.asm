; DESCRIPTION: Draws a purple rectangle at (185, 122) with width 35 and height 95.
; PLAN: r0=185(x), r1=122(y), r2=35(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 122
LDI r2, 35
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
