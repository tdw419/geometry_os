; DESCRIPTION: Draws a green rectangle at (35, 63) with width 88 and height 61.
; PLAN: r0=35(x), r1=63(y), r2=88(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 63
LDI r2, 88
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
