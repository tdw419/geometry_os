; DESCRIPTION: Draws a green rectangle at (128, 227) with width 88 and height 21.
; PLAN: r0=128(x), r1=227(y), r2=88(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 227
LDI r2, 88
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
