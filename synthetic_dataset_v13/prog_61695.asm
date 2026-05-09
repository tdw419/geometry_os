; DESCRIPTION: Composite: Sets a single red pixel at (236, 19) then Renders a green line between points (44, 174) and (468, 93) then Renders a black disk with center (148, 182) and radius 15.
; PLAN: r0=236(x), r1=19(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=44(x1), r6=174(y1), r7=468(x2), r8=93(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=182(y), r12=15(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 236
LDI r1, 19
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 44
LDI r6, 174
LDI r7, 468
LDI r8, 93
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 182
LDI r12, 15
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
