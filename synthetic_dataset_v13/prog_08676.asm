; DESCRIPTION: Draws a green rectangle at (316, 75) with width 71 and height 20.
; PLAN: r0=316(x), r1=75(y), r2=71(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 75
LDI r2, 71
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
