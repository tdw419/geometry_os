; DESCRIPTION: Draws a blue rectangle at (144, 118) with width 89 and height 80.
; PLAN: r0=144(x), r1=118(y), r2=89(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 118
LDI r2, 89
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
