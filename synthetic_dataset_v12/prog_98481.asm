; DESCRIPTION: Composite: Sets a single orange pixel at (48, 86) then Draws a purple line from (212, 142) to (281, 10) then Creates a green circular shape at (251, 137) with radius 65.
; PLAN: r0=48(x), r1=86(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=212(x1), r6=142(y1), r7=281(x2), r8=10(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=137(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 86
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 212
LDI r6, 142
LDI r7, 281
LDI r8, 10
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 137
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
