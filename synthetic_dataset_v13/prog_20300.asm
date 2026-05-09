; DESCRIPTION: Draws a yellow rectangle at (56, 169) with width 29 and height 58.
; PLAN: r0=56(x), r1=169(y), r2=29(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 169
LDI r2, 29
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
