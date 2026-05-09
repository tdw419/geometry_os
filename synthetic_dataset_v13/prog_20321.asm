; DESCRIPTION: Draws a green rectangle at (48, 88) with width 73 and height 84.
; PLAN: r0=48(x), r1=88(y), r2=73(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 88
LDI r2, 73
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
