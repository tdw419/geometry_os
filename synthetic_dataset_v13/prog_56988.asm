; DESCRIPTION: Draws a green rectangle at (396, 104) with width 68 and height 106.
; PLAN: r0=396(x), r1=104(y), r2=68(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 104
LDI r2, 68
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
