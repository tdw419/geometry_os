; DESCRIPTION: Draws a yellow rectangle at (209, 132) with width 96 and height 106.
; PLAN: r0=209(x), r1=132(y), r2=96(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 132
LDI r2, 96
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
