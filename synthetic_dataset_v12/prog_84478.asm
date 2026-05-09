; DESCRIPTION: Draws a yellow rectangle at (136, 101) with width 96 and height 113.
; PLAN: r0=136(x), r1=101(y), r2=96(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 101
LDI r2, 96
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
