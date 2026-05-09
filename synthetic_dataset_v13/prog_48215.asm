; DESCRIPTION: Draws a blue rectangle at (416, 122) with width 21 and height 102.
; PLAN: r0=416(x), r1=122(y), r2=21(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 122
LDI r2, 21
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
