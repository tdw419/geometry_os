; DESCRIPTION: Draws a black rectangle at (188, 103) with width 31 and height 118.
; PLAN: r0=188(x), r1=103(y), r2=31(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 103
LDI r2, 31
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
