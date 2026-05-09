; DESCRIPTION: Draws a green rectangle at (50, 104) with width 83 and height 47.
; PLAN: r0=50(x), r1=104(y), r2=83(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 104
LDI r2, 83
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
