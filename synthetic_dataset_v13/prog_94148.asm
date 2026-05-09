; DESCRIPTION: Draws a white rectangle at (204, 43) with width 52 and height 80.
; PLAN: r0=204(x), r1=43(y), r2=52(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 43
LDI r2, 52
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
