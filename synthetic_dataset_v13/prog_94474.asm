; DESCRIPTION: Draws a green rectangle at (437, 22) with width 13 and height 104.
; PLAN: r0=437(x), r1=22(y), r2=13(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 22
LDI r2, 13
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
