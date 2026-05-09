; DESCRIPTION: Draws a purple rectangle at (353, 118) with width 76 and height 119.
; PLAN: r0=353(x), r1=118(y), r2=76(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 118
LDI r2, 76
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
