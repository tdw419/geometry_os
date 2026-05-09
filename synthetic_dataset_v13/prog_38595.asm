; DESCRIPTION: Draws a yellow rectangle at (376, 144) with width 29 and height 89.
; PLAN: r0=376(x), r1=144(y), r2=29(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 144
LDI r2, 29
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
