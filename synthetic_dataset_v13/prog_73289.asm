; DESCRIPTION: Composite: Creates a orange circular shape at (225, 182) with radius 68 then Renders a orange line between points (97, 144) and (36, 201) then Sets a single cyan pixel at (196, 11).
; PLAN: r0=225(x), r1=182(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=97(x1), r6=144(y1), r7=36(x2), r8=201(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=11(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 182
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 97
LDI r6, 144
LDI r7, 36
LDI r8, 201
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 11
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
