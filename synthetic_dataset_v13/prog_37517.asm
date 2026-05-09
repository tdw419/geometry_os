; DESCRIPTION: Draws a blue rectangle at (435, 78) with width 56 and height 119.
; PLAN: r0=435(x), r1=78(y), r2=56(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 78
LDI r2, 56
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
