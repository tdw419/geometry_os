; DESCRIPTION: Draws a blue rectangle at (314, 20) with width 97 and height 90.
; PLAN: r0=314(x), r1=20(y), r2=97(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 20
LDI r2, 97
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
