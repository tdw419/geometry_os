; DESCRIPTION: Draws a green rectangle at (142, 20) with width 78 and height 75.
; PLAN: r0=142(x), r1=20(y), r2=78(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 20
LDI r2, 78
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
