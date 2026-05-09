; DESCRIPTION: Draws a purple rectangle at (248, 97) with width 37 and height 78.
; PLAN: r0=248(x), r1=97(y), r2=37(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 97
LDI r2, 37
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
