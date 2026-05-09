; DESCRIPTION: Draws a blue rectangle at (339, 29) with width 52 and height 108.
; PLAN: r0=339(x), r1=29(y), r2=52(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 29
LDI r2, 52
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
