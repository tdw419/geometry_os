; DESCRIPTION: Draws a green rectangle at (163, 146) with width 104 and height 78.
; PLAN: r0=163(x), r1=146(y), r2=104(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 146
LDI r2, 104
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
