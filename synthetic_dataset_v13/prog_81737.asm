; DESCRIPTION: Draws a green rectangle at (375, 83) with width 78 and height 57.
; PLAN: r0=375(x), r1=83(y), r2=78(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 83
LDI r2, 78
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
