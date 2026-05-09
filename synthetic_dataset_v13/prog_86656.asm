; DESCRIPTION: Draws a yellow rectangle at (141, 75) with width 84 and height 92.
; PLAN: r0=141(x), r1=75(y), r2=84(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 75
LDI r2, 84
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
