; DESCRIPTION: Draws a green rectangle at (285, 108) with width 15 and height 67.
; PLAN: r0=285(x), r1=108(y), r2=15(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 108
LDI r2, 15
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
