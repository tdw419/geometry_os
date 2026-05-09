; DESCRIPTION: Draws a purple rectangle at (341, 203) with width 19 and height 35.
; PLAN: r0=341(x), r1=203(y), r2=19(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 203
LDI r2, 19
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
