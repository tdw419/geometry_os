; DESCRIPTION: Draws a green rectangle at (139, 16) with width 70 and height 114.
; PLAN: r0=139(x), r1=16(y), r2=70(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 16
LDI r2, 70
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
