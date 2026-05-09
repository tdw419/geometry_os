; DESCRIPTION: Draws a green rectangle at (115, 122) with width 66 and height 114.
; PLAN: r0=115(x), r1=122(y), r2=66(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 122
LDI r2, 66
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
