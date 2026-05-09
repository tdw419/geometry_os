; DESCRIPTION: Draws a blue rectangle at (351, 1) with width 88 and height 59.
; PLAN: r0=351(x), r1=1(y), r2=88(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 1
LDI r2, 88
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
