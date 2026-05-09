; DESCRIPTION: Draws a blue rectangle at (313, 139) with width 69 and height 110.
; PLAN: r0=313(x), r1=139(y), r2=69(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 139
LDI r2, 69
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
