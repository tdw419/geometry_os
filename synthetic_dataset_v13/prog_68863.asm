; DESCRIPTION: Draws a white rectangle at (98, 110) with width 106 and height 92.
; PLAN: r0=98(x), r1=110(y), r2=106(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 110
LDI r2, 106
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
