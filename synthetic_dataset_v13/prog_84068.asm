; DESCRIPTION: Draws a green rectangle at (5, 6) with width 90 and height 43.
; PLAN: r0=5(x), r1=6(y), r2=90(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 6
LDI r2, 90
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
