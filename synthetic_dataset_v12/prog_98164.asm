; DESCRIPTION: Draws a white rectangle at (447, 147) with width 19 and height 101.
; PLAN: r0=447(x), r1=147(y), r2=19(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 147
LDI r2, 19
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
