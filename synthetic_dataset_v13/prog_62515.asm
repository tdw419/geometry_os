; DESCRIPTION: Draws a blue rectangle at (416, 0) with width 72 and height 11.
; PLAN: r0=416(x), r1=0(y), r2=72(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 0
LDI r2, 72
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
