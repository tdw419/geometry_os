; DESCRIPTION: Draws a green rectangle at (54, 73) with width 114 and height 69.
; PLAN: r0=54(x), r1=73(y), r2=114(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 73
LDI r2, 114
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
