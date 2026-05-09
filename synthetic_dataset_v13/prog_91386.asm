; DESCRIPTION: Draws a purple rectangle at (339, 5) with width 105 and height 45.
; PLAN: r0=339(x), r1=5(y), r2=105(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 5
LDI r2, 105
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
