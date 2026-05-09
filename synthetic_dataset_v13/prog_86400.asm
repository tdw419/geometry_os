; DESCRIPTION: Draws a purple rectangle at (291, 216) with width 20 and height 13.
; PLAN: r0=291(x), r1=216(y), r2=20(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 216
LDI r2, 20
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
