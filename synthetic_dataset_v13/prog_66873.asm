; DESCRIPTION: Draws a red rectangle at (147, 155) with width 111 and height 35.
; PLAN: r0=147(x), r1=155(y), r2=111(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 155
LDI r2, 111
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
