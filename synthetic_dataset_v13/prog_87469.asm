; DESCRIPTION: Draws a purple rectangle at (353, 150) with width 78 and height 74.
; PLAN: r0=353(x), r1=150(y), r2=78(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 150
LDI r2, 78
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
