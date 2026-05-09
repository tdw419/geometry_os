; DESCRIPTION: Draws a green rectangle at (81, 29) with width 73 and height 85.
; PLAN: r0=81(x), r1=29(y), r2=73(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 29
LDI r2, 73
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
