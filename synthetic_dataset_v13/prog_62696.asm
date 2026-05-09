; DESCRIPTION: Composite: Places a blue dot at position (278, 105) then Places a red line segment connecting (181, 15) to (303, 182) then Places a purple circle of radius 66 at center (276, 142).
; PLAN: r0=278(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=181(x1), r6=15(y1), r7=303(x2), r8=182(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=142(y), r12=66(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 278
LDI r1, 105
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 15
LDI r7, 303
LDI r8, 182
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 142
LDI r12, 66
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
