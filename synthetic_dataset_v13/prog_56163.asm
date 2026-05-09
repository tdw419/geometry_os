; DESCRIPTION: Draws a white rectangle at (248, 6) with width 78 and height 92.
; PLAN: r0=248(x), r1=6(y), r2=78(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 6
LDI r2, 78
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
