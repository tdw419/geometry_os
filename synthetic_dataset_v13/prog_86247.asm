; DESCRIPTION: Composite: Creates a yellow rectangular region at (147, 218) spanning 85 by 19 pixels then Places a blue dot at position (179, 235) then Renders a red line between points (366, 127) and (506, 108).
; PLAN: r0=147(x), r1=218(y), r2=85(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=235(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=127(y1), r12=506(x2), r13=108(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 218
LDI r2, 85
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 235
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 127
LDI r12, 506
LDI r13, 108
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
