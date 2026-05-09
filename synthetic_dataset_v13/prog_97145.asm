; DESCRIPTION: Draws a blue rectangle at (276, 147) with width 68 and height 58.
; PLAN: r0=276(x), r1=147(y), r2=68(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 147
LDI r2, 68
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
