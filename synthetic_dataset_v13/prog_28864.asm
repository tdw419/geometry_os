; DESCRIPTION: Draws a black rectangle at (324, 9) with width 29 and height 43.
; PLAN: r0=324(x), r1=9(y), r2=29(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 9
LDI r2, 29
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
