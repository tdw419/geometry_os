; DESCRIPTION: Draws a green rectangle at (377, 133) with width 75 and height 92.
; PLAN: r0=377(x), r1=133(y), r2=75(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 133
LDI r2, 75
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
