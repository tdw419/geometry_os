; DESCRIPTION: Composite: Draws a yellow line from (385, 156) to (456, 176) then Sets a single magenta pixel at (100, 224) then Draws a green rectangle at (145, 4) with width 89 and height 73.
; PLAN: r0=385(x1), r1=156(y1), r2=456(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=224(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=145(x), r11=4(y), r12=89(width), r13=73(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 156
LDI r2, 456
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 224
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 145
LDI r11, 4
LDI r12, 89
LDI r13, 73
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
