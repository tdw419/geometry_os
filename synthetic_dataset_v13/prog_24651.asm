; DESCRIPTION: Draws a purple rectangle at (375, 191) with width 74 and height 17.
; PLAN: r0=375(x), r1=191(y), r2=74(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 191
LDI r2, 74
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
