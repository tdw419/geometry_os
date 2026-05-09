; DESCRIPTION: Draws a black rectangle at (232, 35) with width 33 and height 39.
; PLAN: r0=232(x), r1=35(y), r2=33(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 35
LDI r2, 33
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
