; DESCRIPTION: Composite: Sets a single orange pixel at (464, 248) then Renders a red line between points (88, 48) and (195, 134) then Creates a yellow circular shape at (381, 181) with radius 71.
; PLAN: r0=464(x), r1=248(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=88(x1), r6=48(y1), r7=195(x2), r8=134(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=181(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 248
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 88
LDI r6, 48
LDI r7, 195
LDI r8, 134
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 181
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
