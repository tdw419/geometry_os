; DESCRIPTION: Draws a blue rectangle at (203, 5) with width 18 and height 90.
; PLAN: r0=203(x), r1=5(y), r2=18(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 5
LDI r2, 18
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
