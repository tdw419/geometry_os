; DESCRIPTION: Composite: Places a magenta dot at position (314, 193) then Creates a yellow circular shape at (209, 143) with radius 72 then Draws a red line from (463, 156) to (79, 155).
; PLAN: r0=314(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x), r6=143(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=463(x1), r11=156(y1), r12=79(x2), r13=155(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 143
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 463
LDI r11, 156
LDI r12, 79
LDI r13, 155
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
