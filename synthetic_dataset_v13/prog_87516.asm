; DESCRIPTION: Draws a green rectangle at (92, 118) with width 92 and height 84.
; PLAN: r0=92(x), r1=118(y), r2=92(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 118
LDI r2, 92
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
