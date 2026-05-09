; DESCRIPTION: Composite: Places a green line segment connecting (285, 100) to (95, 23) then Sets a single orange pixel at (438, 186) then Creates a yellow circular shape at (112, 195) with radius 46.
; PLAN: r0=285(x1), r1=100(y1), r2=95(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=186(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=195(y), r12=46(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 100
LDI r2, 95
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 186
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 112
LDI r11, 195
LDI r12, 46
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
