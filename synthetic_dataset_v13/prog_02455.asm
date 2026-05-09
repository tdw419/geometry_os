; DESCRIPTION: Draws a yellow rectangle at (285, 81) with width 75 and height 62.
; PLAN: r0=285(x), r1=81(y), r2=75(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 81
LDI r2, 75
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
