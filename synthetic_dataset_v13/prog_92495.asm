; DESCRIPTION: Draws a green rectangle at (207, 104) with width 79 and height 26.
; PLAN: r0=207(x), r1=104(y), r2=79(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 104
LDI r2, 79
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
