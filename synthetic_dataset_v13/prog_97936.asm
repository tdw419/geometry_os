; DESCRIPTION: Draws a purple rectangle at (248, 57) with width 28 and height 37.
; PLAN: r0=248(x), r1=57(y), r2=28(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 57
LDI r2, 28
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
