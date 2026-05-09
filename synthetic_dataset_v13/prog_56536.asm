; DESCRIPTION: Draws a green rectangle at (174, 118) with width 30 and height 116.
; PLAN: r0=174(x), r1=118(y), r2=30(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 118
LDI r2, 30
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
