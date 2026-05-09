; DESCRIPTION: Draws a purple rectangle at (209, 140) with width 69 and height 101.
; PLAN: r0=209(x), r1=140(y), r2=69(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 140
LDI r2, 69
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
