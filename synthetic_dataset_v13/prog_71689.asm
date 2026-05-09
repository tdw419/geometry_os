; DESCRIPTION: Draws a blue rectangle at (19, 78) with width 118 and height 78.
; PLAN: r0=19(x), r1=78(y), r2=118(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 78
LDI r2, 118
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
