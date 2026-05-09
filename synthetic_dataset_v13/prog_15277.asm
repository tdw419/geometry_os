; DESCRIPTION: Draws a green rectangle at (261, 87) with width 29 and height 21.
; PLAN: r0=261(x), r1=87(y), r2=29(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 87
LDI r2, 29
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
