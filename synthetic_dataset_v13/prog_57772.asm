; DESCRIPTION: Draws a white rectangle at (232, 75) with width 74 and height 14.
; PLAN: r0=232(x), r1=75(y), r2=74(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 75
LDI r2, 74
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
