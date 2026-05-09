; DESCRIPTION: Draws a black rectangle at (241, 148) with width 114 and height 67.
; PLAN: r0=241(x), r1=148(y), r2=114(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 148
LDI r2, 114
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
