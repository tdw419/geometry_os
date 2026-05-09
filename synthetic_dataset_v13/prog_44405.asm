; DESCRIPTION: Composite: Places a purple dot at position (341, 145) then Places a red line segment connecting (441, 104) to (88, 208) then Places a cyan circle of radius 52 at center (86, 105).
; PLAN: r0=341(x), r1=145(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=441(x1), r6=104(y1), r7=88(x2), r8=208(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=86(x), r11=105(y), r12=52(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 145
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 441
LDI r6, 104
LDI r7, 88
LDI r8, 208
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 105
LDI r12, 52
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
