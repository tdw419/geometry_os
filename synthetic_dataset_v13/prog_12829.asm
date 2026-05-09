; DESCRIPTION: Composite: Renders a yellow line between points (264, 132) and (190, 83) then Sets a single yellow pixel at (301, 45) then Creates a orange circular shape at (129, 184) with radius 13.
; PLAN: r0=264(x1), r1=132(y1), r2=190(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=45(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=184(y), r12=13(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 132
LDI r2, 190
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 45
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 129
LDI r11, 184
LDI r12, 13
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
