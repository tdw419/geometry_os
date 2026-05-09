; DESCRIPTION: Draws a green rectangle at (205, 54) with width 61 and height 15.
; PLAN: r0=205(x), r1=54(y), r2=61(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 54
LDI r2, 61
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
