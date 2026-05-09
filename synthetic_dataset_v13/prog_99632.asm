; DESCRIPTION: Draws a black rectangle at (194, 34) with width 26 and height 32.
; PLAN: r0=194(x), r1=34(y), r2=26(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 34
LDI r2, 26
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
