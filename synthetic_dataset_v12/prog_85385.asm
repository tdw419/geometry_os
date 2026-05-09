; DESCRIPTION: Composite: Draws a green line from (345, 71) to (156, 182) then Draws a blue circle centered at (71, 61) with radius 52 then Creates a yellow rectangular region at (235, 134) spanning 95 by 79 pixels.
; PLAN: r0=345(x1), r1=71(y1), r2=156(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=61(y), r7=52(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=235(x), r11=134(y), r12=95(width), r13=79(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 71
LDI r2, 156
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 61
LDI r7, 52
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 235
LDI r11, 134
LDI r12, 95
LDI r13, 79
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
