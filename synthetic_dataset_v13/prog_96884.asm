; DESCRIPTION: Draws a black rectangle at (221, 29) with width 71 and height 15.
; PLAN: r0=221(x), r1=29(y), r2=71(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 29
LDI r2, 71
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
