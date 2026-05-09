; DESCRIPTION: Draws a green rectangle at (116, 29) with width 119 and height 120.
; PLAN: r0=116(x), r1=29(y), r2=119(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 29
LDI r2, 119
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
