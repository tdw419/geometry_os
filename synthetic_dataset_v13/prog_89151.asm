; DESCRIPTION: Draws a black rectangle at (399, 17) with width 71 and height 13.
; PLAN: r0=399(x), r1=17(y), r2=71(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 17
LDI r2, 71
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
