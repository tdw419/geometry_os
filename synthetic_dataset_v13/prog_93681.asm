; DESCRIPTION: Draws a green rectangle at (10, 114) with width 102 and height 74.
; PLAN: r0=10(x), r1=114(y), r2=102(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 114
LDI r2, 102
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
