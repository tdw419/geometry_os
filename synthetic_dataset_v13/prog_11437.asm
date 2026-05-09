; DESCRIPTION: Draws a blue rectangle at (123, 115) with width 24 and height 88.
; PLAN: r0=123(x), r1=115(y), r2=24(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 115
LDI r2, 24
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
