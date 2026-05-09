; DESCRIPTION: Composite: Draws a black line from (85, 199) to (27, 14) then Creates a yellow circular shape at (163, 142) with radius 61 then Sets a single cyan pixel at (8, 144).
; PLAN: r0=85(x1), r1=199(y1), r2=27(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=142(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=144(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 199
LDI r2, 27
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 142
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 144
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
