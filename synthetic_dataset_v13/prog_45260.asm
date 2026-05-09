; DESCRIPTION: Draws a green rectangle at (265, 142) with width 116 and height 75.
; PLAN: r0=265(x), r1=142(y), r2=116(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 142
LDI r2, 116
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
