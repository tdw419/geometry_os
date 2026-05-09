; DESCRIPTION: Draws a blue rectangle at (135, 98) with width 28 and height 88.
; PLAN: r0=135(x), r1=98(y), r2=28(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 98
LDI r2, 28
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
