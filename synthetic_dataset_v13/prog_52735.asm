; DESCRIPTION: Draws a purple rectangle at (366, 99) with width 36 and height 67.
; PLAN: r0=366(x), r1=99(y), r2=36(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 99
LDI r2, 36
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
