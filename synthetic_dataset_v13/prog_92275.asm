; DESCRIPTION: Draws a black rectangle at (114, 28) with width 88 and height 47.
; PLAN: r0=114(x), r1=28(y), r2=88(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 28
LDI r2, 88
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
