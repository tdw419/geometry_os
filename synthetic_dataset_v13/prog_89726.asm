; DESCRIPTION: Draws a green rectangle at (118, 6) with width 120 and height 66.
; PLAN: r0=118(x), r1=6(y), r2=120(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 6
LDI r2, 120
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
