; DESCRIPTION: Draws a blue rectangle at (203, 142) with width 119 and height 98.
; PLAN: r0=203(x), r1=142(y), r2=119(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 142
LDI r2, 119
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
