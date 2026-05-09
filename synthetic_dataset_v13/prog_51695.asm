; DESCRIPTION: Draws a green rectangle at (212, 28) with width 52 and height 69.
; PLAN: r0=212(x), r1=28(y), r2=52(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 28
LDI r2, 52
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
