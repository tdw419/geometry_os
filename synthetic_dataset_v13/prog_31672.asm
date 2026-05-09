; DESCRIPTION: Draws a green rectangle at (271, 8) with width 81 and height 88.
; PLAN: r0=271(x), r1=8(y), r2=81(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 8
LDI r2, 81
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
