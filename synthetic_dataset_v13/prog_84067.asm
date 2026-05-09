; DESCRIPTION: Draws a green rectangle at (47, 22) with width 120 and height 74.
; PLAN: r0=47(x), r1=22(y), r2=120(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 22
LDI r2, 120
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
