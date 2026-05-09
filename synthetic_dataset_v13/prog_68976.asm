; DESCRIPTION: Draws a blue rectangle at (144, 33) with width 118 and height 17.
; PLAN: r0=144(x), r1=33(y), r2=118(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 33
LDI r2, 118
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
