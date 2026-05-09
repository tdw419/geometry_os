; DESCRIPTION: Draws a blue rectangle at (181, 162) with width 102 and height 66.
; PLAN: r0=181(x), r1=162(y), r2=102(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 162
LDI r2, 102
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
