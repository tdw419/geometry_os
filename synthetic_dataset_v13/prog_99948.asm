; DESCRIPTION: Draws a green rectangle at (435, 35) with width 69 and height 56.
; PLAN: r0=435(x), r1=35(y), r2=69(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 35
LDI r2, 69
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
