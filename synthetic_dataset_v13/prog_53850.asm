; DESCRIPTION: Draws a green rectangle at (423, 86) with width 88 and height 100.
; PLAN: r0=423(x), r1=86(y), r2=88(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 86
LDI r2, 88
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
