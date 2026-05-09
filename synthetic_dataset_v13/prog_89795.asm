; DESCRIPTION: Draws a blue rectangle at (0, 86) with width 118 and height 97.
; PLAN: r0=0(x), r1=86(y), r2=118(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 86
LDI r2, 118
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
