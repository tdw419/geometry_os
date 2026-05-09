; DESCRIPTION: Composite: Draws a magenta line from (31, 140) to (432, 202) then Places a yellow dot at position (426, 235) then Creates a green rectangular region at (11, 71) spanning 101 by 89 pixels.
; PLAN: r0=31(x1), r1=140(y1), r2=432(x2), r3=202(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=11(x), r11=71(y), r12=101(width), r13=89(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 140
LDI r2, 432
LDI r3, 202
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 11
LDI r11, 71
LDI r12, 101
LDI r13, 89
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
