; DESCRIPTION: Composite: Sets a single red pixel at (414, 178) then Places a black line segment connecting (130, 202) to (347, 202) then Draws a magenta rectangle at (127, 142) with width 101 and height 92.
; PLAN: r0=414(x), r1=178(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=130(x1), r6=202(y1), r7=347(x2), r8=202(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=127(x), r11=142(y), r12=101(width), r13=92(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 178
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 130
LDI r6, 202
LDI r7, 347
LDI r8, 202
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 142
LDI r12, 101
LDI r13, 92
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
