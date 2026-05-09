; DESCRIPTION: Draws a green rectangle at (332, 81) with width 70 and height 54.
; PLAN: r0=332(x), r1=81(y), r2=70(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 81
LDI r2, 70
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
