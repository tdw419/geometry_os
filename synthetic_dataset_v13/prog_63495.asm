; DESCRIPTION: Draws a green rectangle at (52, 113) with width 73 and height 34.
; PLAN: r0=52(x), r1=113(y), r2=73(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 113
LDI r2, 73
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
