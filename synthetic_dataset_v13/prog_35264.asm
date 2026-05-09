; DESCRIPTION: Draws a purple rectangle at (261, 178) with width 114 and height 13.
; PLAN: r0=261(x), r1=178(y), r2=114(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 178
LDI r2, 114
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
