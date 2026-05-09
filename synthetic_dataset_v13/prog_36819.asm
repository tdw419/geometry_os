; DESCRIPTION: Draws a black rectangle at (194, 114) with width 23 and height 16.
; PLAN: r0=194(x), r1=114(y), r2=23(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 114
LDI r2, 23
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
