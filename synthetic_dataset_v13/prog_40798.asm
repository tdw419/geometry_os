; DESCRIPTION: Draws a green rectangle at (372, 147) with width 101 and height 61.
; PLAN: r0=372(x), r1=147(y), r2=101(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 147
LDI r2, 101
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
