; DESCRIPTION: Draws a purple rectangle at (366, 117) with width 110 and height 26.
; PLAN: r0=366(x), r1=117(y), r2=110(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 117
LDI r2, 110
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
