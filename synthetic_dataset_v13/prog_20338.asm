; DESCRIPTION: Draws a blue rectangle at (288, 117) with width 81 and height 88.
; PLAN: r0=288(x), r1=117(y), r2=81(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 117
LDI r2, 81
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
