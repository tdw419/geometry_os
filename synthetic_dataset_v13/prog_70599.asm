; DESCRIPTION: Draws a purple rectangle at (196, 97) with width 114 and height 104.
; PLAN: r0=196(x), r1=97(y), r2=114(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 97
LDI r2, 114
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
