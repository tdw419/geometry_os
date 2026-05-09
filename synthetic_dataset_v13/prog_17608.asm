; DESCRIPTION: Draws a yellow rectangle at (14, 162) with width 105 and height 72.
; PLAN: r0=14(x), r1=162(y), r2=105(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 162
LDI r2, 105
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
