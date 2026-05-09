; DESCRIPTION: Draws a blue rectangle at (79, 88) with width 28 and height 28.
; PLAN: r0=79(x), r1=88(y), r2=28(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 88
LDI r2, 28
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
