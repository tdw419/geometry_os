; DESCRIPTION: Draws a black rectangle at (142, 203) with width 114 and height 23.
; PLAN: r0=142(x), r1=203(y), r2=114(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 203
LDI r2, 114
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
