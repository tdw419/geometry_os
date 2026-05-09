; DESCRIPTION: Composite: Renders a magenta line between points (318, 145) and (174, 232) then Creates a orange circular shape at (404, 221) with radius 23 then Sets a single yellow pixel at (364, 215).
; PLAN: r0=318(x1), r1=145(y1), r2=174(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=221(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=364(x), r11=215(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 145
LDI r2, 174
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 221
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 364
LDI r11, 215
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
