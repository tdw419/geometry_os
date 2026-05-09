; DESCRIPTION: Draws a black rectangle at (177, 147) with width 99 and height 80.
; PLAN: r0=177(x), r1=147(y), r2=99(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 147
LDI r2, 99
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
