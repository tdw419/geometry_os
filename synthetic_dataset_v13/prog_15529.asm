; DESCRIPTION: Draws a blue rectangle at (80, 203) with width 117 and height 33.
; PLAN: r0=80(x), r1=203(y), r2=117(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 203
LDI r2, 117
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
