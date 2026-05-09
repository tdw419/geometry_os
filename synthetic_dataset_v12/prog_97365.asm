; DESCRIPTION: Draws a blue rectangle at (97, 123) with width 92 and height 102.
; PLAN: r0=97(x), r1=123(y), r2=92(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 123
LDI r2, 92
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
