; DESCRIPTION: Draws a green rectangle at (373, 78) with width 84 and height 83.
; PLAN: r0=373(x), r1=78(y), r2=84(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 78
LDI r2, 84
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
