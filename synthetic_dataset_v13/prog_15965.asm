; DESCRIPTION: Draws a black rectangle at (285, 155) with width 36 and height 81.
; PLAN: r0=285(x), r1=155(y), r2=36(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 155
LDI r2, 36
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
