; DESCRIPTION: Draws a black rectangle at (232, 118) with width 35 and height 30.
; PLAN: r0=232(x), r1=118(y), r2=35(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 118
LDI r2, 35
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
