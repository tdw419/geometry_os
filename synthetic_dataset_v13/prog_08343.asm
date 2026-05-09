; DESCRIPTION: Draws a blue rectangle at (455, 69) with width 14 and height 59.
; PLAN: r0=455(x), r1=69(y), r2=14(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 69
LDI r2, 14
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
