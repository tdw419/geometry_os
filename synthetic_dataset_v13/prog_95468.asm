; DESCRIPTION: Draws a green rectangle at (261, 40) with width 39 and height 75.
; PLAN: r0=261(x), r1=40(y), r2=39(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 40
LDI r2, 39
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
