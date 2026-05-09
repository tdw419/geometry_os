; DESCRIPTION: Draws a yellow rectangle at (181, 14) with width 118 and height 59.
; PLAN: r0=181(x), r1=14(y), r2=118(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 14
LDI r2, 118
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
