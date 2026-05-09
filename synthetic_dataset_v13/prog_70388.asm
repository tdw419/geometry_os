; DESCRIPTION: Composite: Draws a purple line from (323, 86) to (139, 95) then Places a blue circle of radius 43 at center (245, 169) then Draws a magenta rectangle at (358, 20) with width 93 and height 51.
; PLAN: r0=323(x1), r1=86(y1), r2=139(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=169(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=358(x), r11=20(y), r12=93(width), r13=51(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 86
LDI r2, 139
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 169
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 358
LDI r11, 20
LDI r12, 93
LDI r13, 51
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
