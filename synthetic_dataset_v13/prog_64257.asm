; DESCRIPTION: Draws a white rectangle at (83, 4) with width 92 and height 24.
; PLAN: r0=83(x), r1=4(y), r2=92(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 4
LDI r2, 92
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
