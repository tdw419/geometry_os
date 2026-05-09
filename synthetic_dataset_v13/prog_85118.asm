; DESCRIPTION: Draws a blue rectangle at (0, 78) with width 109 and height 118.
; PLAN: r0=0(x), r1=78(y), r2=109(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 78
LDI r2, 109
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
