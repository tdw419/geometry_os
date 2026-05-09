; DESCRIPTION: Draws a green rectangle at (272, 95) with width 114 and height 74.
; PLAN: r0=272(x), r1=95(y), r2=114(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 95
LDI r2, 114
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
