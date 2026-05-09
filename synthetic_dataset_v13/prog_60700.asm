; DESCRIPTION: Draws a white rectangle at (0, 147) with width 45 and height 92.
; PLAN: r0=0(x), r1=147(y), r2=45(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 147
LDI r2, 45
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
