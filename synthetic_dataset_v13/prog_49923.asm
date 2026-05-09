; DESCRIPTION: Draws a white rectangle at (84, 147) with width 106 and height 82.
; PLAN: r0=84(x), r1=147(y), r2=106(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 147
LDI r2, 106
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
