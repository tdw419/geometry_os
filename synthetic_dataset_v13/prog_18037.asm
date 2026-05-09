; DESCRIPTION: Draws a green rectangle at (459, 78) with width 14 and height 22.
; PLAN: r0=459(x), r1=78(y), r2=14(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 78
LDI r2, 14
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
