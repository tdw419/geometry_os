; DESCRIPTION: Draws a green rectangle at (297, 88) with width 52 and height 24.
; PLAN: r0=297(x), r1=88(y), r2=52(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 88
LDI r2, 52
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
