; DESCRIPTION: Draws a purple rectangle at (359, 94) with width 78 and height 91.
; PLAN: r0=359(x), r1=94(y), r2=78(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 94
LDI r2, 78
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
