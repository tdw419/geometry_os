; DESCRIPTION: Draws a white rectangle at (30, 17) with width 29 and height 19.
; PLAN: r0=30(x), r1=17(y), r2=29(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 17
LDI r2, 29
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
