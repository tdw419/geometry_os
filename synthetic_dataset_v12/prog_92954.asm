; DESCRIPTION: Draws a blue rectangle at (183, 114) with width 15 and height 118.
; PLAN: r0=183(x), r1=114(y), r2=15(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 114
LDI r2, 15
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
