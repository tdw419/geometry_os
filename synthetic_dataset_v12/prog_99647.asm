; DESCRIPTION: Draws a yellow rectangle at (29, 118) with width 95 and height 96.
; PLAN: r0=29(x), r1=118(y), r2=95(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 118
LDI r2, 95
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
