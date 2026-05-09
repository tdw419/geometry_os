; DESCRIPTION: Draws a green rectangle at (47, 68) with width 96 and height 30.
; PLAN: r0=47(x), r1=68(y), r2=96(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 68
LDI r2, 96
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
