; DESCRIPTION: Draws a yellow rectangle at (105, 133) with width 57 and height 92.
; PLAN: r0=105(x), r1=133(y), r2=57(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 133
LDI r2, 57
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
