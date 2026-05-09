; DESCRIPTION: Draws a blue rectangle at (12, 132) with width 88 and height 81.
; PLAN: r0=12(x), r1=132(y), r2=88(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 132
LDI r2, 88
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
