; DESCRIPTION: Draws a green rectangle at (116, 162) with width 44 and height 69.
; PLAN: r0=116(x), r1=162(y), r2=44(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 162
LDI r2, 44
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
