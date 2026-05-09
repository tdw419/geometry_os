; DESCRIPTION: Draws a green rectangle at (31, 87) with width 65 and height 104.
; PLAN: r0=31(x), r1=87(y), r2=65(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 87
LDI r2, 65
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
