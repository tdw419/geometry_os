; DESCRIPTION: Draws a yellow rectangle at (57, 34) with width 96 and height 43.
; PLAN: r0=57(x), r1=34(y), r2=96(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 34
LDI r2, 96
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
