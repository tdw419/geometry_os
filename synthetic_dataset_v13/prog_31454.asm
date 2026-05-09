; DESCRIPTION: Draws a purple rectangle at (341, 25) with width 69 and height 100.
; PLAN: r0=341(x), r1=25(y), r2=69(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 25
LDI r2, 69
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
