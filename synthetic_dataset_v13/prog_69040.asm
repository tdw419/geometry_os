; DESCRIPTION: Draws a black rectangle at (216, 147) with width 90 and height 99.
; PLAN: r0=216(x), r1=147(y), r2=90(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 147
LDI r2, 90
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
