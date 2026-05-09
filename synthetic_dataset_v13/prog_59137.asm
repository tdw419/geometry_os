; DESCRIPTION: Composite: Sets a single blue pixel at (291, 162) then Renders a cyan line between points (476, 170) and (362, 147) then Creates a black rectangular region at (192, 63) spanning 79 by 96 pixels.
; PLAN: r0=291(x), r1=162(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=170(y1), r7=362(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=63(y), r12=79(width), r13=96(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 162
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 476
LDI r6, 170
LDI r7, 362
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 63
LDI r12, 79
LDI r13, 96
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
