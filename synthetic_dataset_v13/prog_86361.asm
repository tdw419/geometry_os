; DESCRIPTION: Draws a black rectangle at (143, 26) with width 119 and height 54.
; PLAN: r0=143(x), r1=26(y), r2=119(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 26
LDI r2, 119
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
