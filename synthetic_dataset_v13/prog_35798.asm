; DESCRIPTION: Draws a purple rectangle at (203, 75) with width 87 and height 17.
; PLAN: r0=203(x), r1=75(y), r2=87(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 75
LDI r2, 87
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
