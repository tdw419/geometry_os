; DESCRIPTION: Draws a blue rectangle at (81, 8) with width 88 and height 74.
; PLAN: r0=81(x), r1=8(y), r2=88(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 8
LDI r2, 88
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
