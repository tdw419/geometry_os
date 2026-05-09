; DESCRIPTION: Draws a green rectangle at (171, 81) with width 88 and height 49.
; PLAN: r0=171(x), r1=81(y), r2=88(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 81
LDI r2, 88
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
