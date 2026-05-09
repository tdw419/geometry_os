; DESCRIPTION: Draws a black rectangle at (233, 143) with width 26 and height 66.
; PLAN: r0=233(x), r1=143(y), r2=26(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 143
LDI r2, 26
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
