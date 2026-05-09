; DESCRIPTION: Draws a purple rectangle at (207, 19) with width 56 and height 26.
; PLAN: r0=207(x), r1=19(y), r2=56(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 19
LDI r2, 56
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
