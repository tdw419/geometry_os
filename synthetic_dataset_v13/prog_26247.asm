; DESCRIPTION: Composite: Sets a single black pixel at (182, 182) then Renders a yellow line between points (364, 14) and (169, 85) then Places a black circle of radius 20 at center (150, 107).
; PLAN: r0=182(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=14(y1), r7=169(x2), r8=85(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=150(x), r11=107(y), r12=20(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 14
LDI r7, 169
LDI r8, 85
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 107
LDI r12, 20
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
