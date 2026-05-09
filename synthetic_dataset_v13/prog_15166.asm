; DESCRIPTION: Draws a black rectangle at (356, 101) with width 119 and height 116.
; PLAN: r0=356(x), r1=101(y), r2=119(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 101
LDI r2, 119
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
