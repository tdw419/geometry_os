; DESCRIPTION: Draws a magenta rectangle at (347, 169) with width 17 and height 47.
; PLAN: r0=347(x), r1=169(y), r2=17(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 169
LDI r2, 17
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
