; DESCRIPTION: Draws a black rectangle at (157, 116) with width 114 and height 56.
; PLAN: r0=157(x), r1=116(y), r2=114(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 116
LDI r2, 114
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
