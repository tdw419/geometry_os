; DESCRIPTION: Draws a green rectangle at (342, 172) with width 114 and height 84.
; PLAN: r0=342(x), r1=172(y), r2=114(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 172
LDI r2, 114
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
