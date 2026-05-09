; DESCRIPTION: Draws a yellow rectangle at (144, 36) with width 99 and height 114.
; PLAN: r0=144(x), r1=36(y), r2=99(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 36
LDI r2, 99
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
