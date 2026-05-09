; DESCRIPTION: Draws a white rectangle at (188, 139) with width 69 and height 114.
; PLAN: r0=188(x), r1=139(y), r2=69(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 139
LDI r2, 69
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
