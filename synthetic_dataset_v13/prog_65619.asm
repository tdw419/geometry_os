; DESCRIPTION: Draws a blue rectangle at (101, 155) with width 105 and height 78.
; PLAN: r0=101(x), r1=155(y), r2=105(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 155
LDI r2, 105
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
