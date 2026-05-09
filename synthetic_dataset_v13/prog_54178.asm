; DESCRIPTION: Composite: Renders a green disk with center (216, 181) and radius 75 then Renders a red line between points (105, 104) and (102, 182) then Sets a single orange pixel at (497, 98).
; PLAN: r0=216(x), r1=181(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=104(y1), r7=102(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=497(x), r11=98(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 181
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 104
LDI r7, 102
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 98
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
