; DESCRIPTION: Draws a green rectangle at (10, 3) with width 52 and height 81.
; PLAN: r0=10(x), r1=3(y), r2=52(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 3
LDI r2, 52
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
