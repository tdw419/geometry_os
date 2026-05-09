; DESCRIPTION: Draws a black rectangle at (118, 35) with width 17 and height 44.
; PLAN: r0=118(x), r1=35(y), r2=17(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 35
LDI r2, 17
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
