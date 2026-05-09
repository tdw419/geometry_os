; DESCRIPTION: Composite: Renders a purple line between points (31, 225) and (163, 103) then Sets a single yellow pixel at (169, 243) then Creates a magenta rectangular region at (263, 72) spanning 109 by 115 pixels.
; PLAN: r0=31(x1), r1=225(y1), r2=163(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=243(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=263(x), r11=72(y), r12=109(width), r13=115(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 225
LDI r2, 163
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 243
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 263
LDI r11, 72
LDI r12, 109
LDI r13, 115
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
