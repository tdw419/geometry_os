; DESCRIPTION: Draws a black rectangle at (62, 62) with width 34 and height 116.
; PLAN: r0=62(x), r1=62(y), r2=34(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 62
LDI r2, 34
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
