; DESCRIPTION: Draws a blue rectangle at (67, 143) with width 51 and height 88.
; PLAN: r0=67(x), r1=143(y), r2=51(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 143
LDI r2, 51
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
