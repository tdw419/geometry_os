; DESCRIPTION: Draws a blue rectangle at (50, 170) with width 88 and height 80.
; PLAN: r0=50(x), r1=170(y), r2=88(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 170
LDI r2, 88
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
