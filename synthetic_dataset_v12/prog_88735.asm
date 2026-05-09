; DESCRIPTION: Draws a blue rectangle at (43, 88) with width 72 and height 32.
; PLAN: r0=43(x), r1=88(y), r2=72(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 88
LDI r2, 72
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
