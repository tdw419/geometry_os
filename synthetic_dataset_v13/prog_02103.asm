; DESCRIPTION: Composite: Sets a single black pixel at (388, 87) then Draws a green line from (51, 58) to (172, 167) then Creates a black rectangular region at (176, 142) spanning 63 by 29 pixels.
; PLAN: r0=388(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=51(x1), r6=58(y1), r7=172(x2), r8=167(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=142(y), r12=63(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 51
LDI r6, 58
LDI r7, 172
LDI r8, 167
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 142
LDI r12, 63
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
