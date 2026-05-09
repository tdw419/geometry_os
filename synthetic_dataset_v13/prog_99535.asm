; DESCRIPTION: Draws a blue rectangle at (291, 170) with width 25 and height 79.
; PLAN: r0=291(x), r1=170(y), r2=25(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 170
LDI r2, 25
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
