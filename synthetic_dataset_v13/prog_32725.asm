; DESCRIPTION: Draws a green rectangle at (133, 5) with width 92 and height 92.
; PLAN: r0=133(x), r1=5(y), r2=92(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 5
LDI r2, 92
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
