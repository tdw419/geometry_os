; DESCRIPTION: Composite: Draws a yellow line from (322, 57) to (248, 43) then Sets a single blue pixel at (162, 221) then Renders a yellow box of size 22x63 starting at (476, 39).
; PLAN: r0=322(x1), r1=57(y1), r2=248(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=221(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=476(x), r11=39(y), r12=22(width), r13=63(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 57
LDI r2, 248
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 221
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 476
LDI r11, 39
LDI r12, 22
LDI r13, 63
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
