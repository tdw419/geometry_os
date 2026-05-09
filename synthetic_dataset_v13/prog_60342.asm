; DESCRIPTION: Draws a yellow rectangle at (53, 72) with width 116 and height 90.
; PLAN: r0=53(x), r1=72(y), r2=116(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 72
LDI r2, 116
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
