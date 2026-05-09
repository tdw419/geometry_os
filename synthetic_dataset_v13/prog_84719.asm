; DESCRIPTION: Draws a green rectangle at (137, 88) with width 70 and height 48.
; PLAN: r0=137(x), r1=88(y), r2=70(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 88
LDI r2, 70
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
