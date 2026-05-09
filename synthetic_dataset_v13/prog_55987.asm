; DESCRIPTION: Draws a green rectangle at (285, 122) with width 37 and height 81.
; PLAN: r0=285(x), r1=122(y), r2=37(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 122
LDI r2, 37
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
