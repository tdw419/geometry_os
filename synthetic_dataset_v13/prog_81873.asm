; DESCRIPTION: Draws a green rectangle at (379, 55) with width 29 and height 17.
; PLAN: r0=379(x), r1=55(y), r2=29(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 55
LDI r2, 29
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
