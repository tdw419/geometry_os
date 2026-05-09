; DESCRIPTION: Draws a green rectangle at (163, 141) with width 120 and height 89.
; PLAN: r0=163(x), r1=141(y), r2=120(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 141
LDI r2, 120
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
