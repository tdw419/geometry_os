; DESCRIPTION: Draws a blue rectangle at (250, 31) with width 62 and height 88.
; PLAN: r0=250(x), r1=31(y), r2=62(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 31
LDI r2, 62
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
