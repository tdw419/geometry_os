; DESCRIPTION: Draws a blue rectangle at (49, 6) with width 114 and height 117.
; PLAN: r0=49(x), r1=6(y), r2=114(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 6
LDI r2, 114
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
