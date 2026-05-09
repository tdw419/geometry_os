; DESCRIPTION: Draws a yellow rectangle at (232, 189) with width 96 and height 61.
; PLAN: r0=232(x), r1=189(y), r2=96(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 189
LDI r2, 96
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
