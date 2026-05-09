; DESCRIPTION: Draws a black rectangle at (341, 175) with width 53 and height 17.
; PLAN: r0=341(x), r1=175(y), r2=53(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 175
LDI r2, 53
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
