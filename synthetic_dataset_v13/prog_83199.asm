; DESCRIPTION: Draws a blue rectangle at (442, 4) with width 52 and height 88.
; PLAN: r0=442(x), r1=4(y), r2=52(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 4
LDI r2, 52
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
