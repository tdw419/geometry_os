; DESCRIPTION: Draws a black rectangle at (30, 84) with width 43 and height 96.
; PLAN: r0=30(x), r1=84(y), r2=43(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 84
LDI r2, 43
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
