; DESCRIPTION: Composite: Sets a single yellow pixel at (369, 9) then Renders a purple line between points (139, 92) and (104, 113) then Draws a cyan circle centered at (378, 75) with radius 62.
; PLAN: r0=369(x), r1=9(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=139(x1), r6=92(y1), r7=104(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=75(y), r12=62(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 9
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 139
LDI r6, 92
LDI r7, 104
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 75
LDI r12, 62
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
