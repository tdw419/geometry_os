; DESCRIPTION: Draws a yellow rectangle at (339, 8) with width 116 and height 17.
; PLAN: r0=339(x), r1=8(y), r2=116(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 8
LDI r2, 116
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
