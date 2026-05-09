; DESCRIPTION: Draws a black rectangle at (133, 169) with width 22 and height 63.
; PLAN: r0=133(x), r1=169(y), r2=22(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 169
LDI r2, 22
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
