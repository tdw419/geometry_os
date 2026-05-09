; DESCRIPTION: Draws a blue rectangle at (315, 139) with width 119 and height 102.
; PLAN: r0=315(x), r1=139(y), r2=119(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 139
LDI r2, 119
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
