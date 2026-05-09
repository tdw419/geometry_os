; DESCRIPTION: Composite: Renders a green line between points (504, 17) and (476, 253) then Creates a magenta rectangular region at (390, 6) spanning 91 by 38 pixels then Sets a single orange pixel at (155, 227).
; PLAN: r0=504(x1), r1=17(y1), r2=476(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=6(y), r7=91(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=227(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 504
LDI r1, 17
LDI r2, 476
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 6
LDI r7, 91
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 227
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
