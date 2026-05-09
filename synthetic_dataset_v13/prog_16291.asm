; DESCRIPTION: Draws a blue rectangle at (203, 189) with width 101 and height 45.
; PLAN: r0=203(x), r1=189(y), r2=101(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 189
LDI r2, 101
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
