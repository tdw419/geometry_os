; DESCRIPTION: Draws a black rectangle at (134, 166) with width 22 and height 14.
; PLAN: r0=134(x), r1=166(y), r2=22(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 166
LDI r2, 22
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
