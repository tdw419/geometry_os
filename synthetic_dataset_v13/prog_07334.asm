; DESCRIPTION: Draws a purple rectangle at (14, 9) with width 40 and height 47.
; PLAN: r0=14(x), r1=9(y), r2=40(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 9
LDI r2, 40
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
