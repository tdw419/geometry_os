; DESCRIPTION: Draws a purple rectangle at (203, 222) with width 40 and height 12.
; PLAN: r0=203(x), r1=222(y), r2=40(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 222
LDI r2, 40
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
