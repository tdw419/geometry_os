; DESCRIPTION: Draws a purple rectangle at (314, 9) with width 44 and height 57.
; PLAN: r0=314(x), r1=9(y), r2=44(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 9
LDI r2, 44
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
