; DESCRIPTION: Draws a black rectangle at (209, 17) with width 43 and height 15.
; PLAN: r0=209(x), r1=17(y), r2=43(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 17
LDI r2, 43
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
