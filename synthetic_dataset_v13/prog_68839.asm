; DESCRIPTION: Draws a black rectangle at (174, 72) with width 58 and height 88.
; PLAN: r0=174(x), r1=72(y), r2=58(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 72
LDI r2, 58
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
