; DESCRIPTION: Draws a green rectangle at (38, 102) with width 117 and height 114.
; PLAN: r0=38(x), r1=102(y), r2=117(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 102
LDI r2, 117
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
