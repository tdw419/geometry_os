; DESCRIPTION: Draws a blue rectangle at (13, 29) with width 49 and height 118.
; PLAN: r0=13(x), r1=29(y), r2=49(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 29
LDI r2, 49
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
