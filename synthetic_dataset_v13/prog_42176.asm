; DESCRIPTION: Composite: Sets a single orange pixel at (451, 40) then Creates a cyan circular shape at (483, 81) with radius 10 then Renders a red line between points (144, 172) and (342, 240).
; PLAN: r0=451(x), r1=40(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=483(x), r6=81(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=144(x1), r11=172(y1), r12=342(x2), r13=240(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 40
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 483
LDI r6, 81
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 144
LDI r11, 172
LDI r12, 342
LDI r13, 240
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
