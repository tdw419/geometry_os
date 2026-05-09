; DESCRIPTION: Draws a blue rectangle at (203, 12) with width 80 and height 64.
; PLAN: r0=203(x), r1=12(y), r2=80(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 80
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
