; DESCRIPTION: Draws a green rectangle at (217, 135) with width 101 and height 94.
; PLAN: r0=217(x), r1=135(y), r2=101(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 135
LDI r2, 101
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
