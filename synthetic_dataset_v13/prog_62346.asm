; DESCRIPTION: Draws a white rectangle at (266, 88) with width 98 and height 20.
; PLAN: r0=266(x), r1=88(y), r2=98(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 88
LDI r2, 98
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
