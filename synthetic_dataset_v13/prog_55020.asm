; DESCRIPTION: Draws a blue rectangle at (85, 83) with width 65 and height 94.
; PLAN: r0=85(x), r1=83(y), r2=65(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 83
LDI r2, 65
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
