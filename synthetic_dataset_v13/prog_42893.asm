; DESCRIPTION: Draws a blue rectangle at (153, 68) with width 30 and height 84.
; PLAN: r0=153(x), r1=68(y), r2=30(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 68
LDI r2, 30
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
