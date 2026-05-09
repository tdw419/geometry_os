; DESCRIPTION: Draws a blue rectangle at (92, 11) with width 118 and height 34.
; PLAN: r0=92(x), r1=11(y), r2=118(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 11
LDI r2, 118
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
