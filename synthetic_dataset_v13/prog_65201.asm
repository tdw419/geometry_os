; DESCRIPTION: Draws a green rectangle at (254, 29) with width 112 and height 12.
; PLAN: r0=254(x), r1=29(y), r2=112(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 29
LDI r2, 112
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
