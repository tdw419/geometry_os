; DESCRIPTION: Draws a blue rectangle at (111, 137) with width 118 and height 114.
; PLAN: r0=111(x), r1=137(y), r2=118(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 137
LDI r2, 118
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
