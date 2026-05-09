; DESCRIPTION: Draws a yellow rectangle at (457, 92) with width 26 and height 92.
; PLAN: r0=457(x), r1=92(y), r2=26(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 92
LDI r2, 26
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
