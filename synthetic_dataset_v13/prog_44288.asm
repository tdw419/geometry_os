; DESCRIPTION: Composite: Sets a single red pixel at (186, 70) then Places a orange line segment connecting (378, 240) to (112, 222) then Creates a yellow circular shape at (184, 153) with radius 49.
; PLAN: r0=186(x), r1=70(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=378(x1), r6=240(y1), r7=112(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=153(y), r12=49(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 186
LDI r1, 70
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 378
LDI r6, 240
LDI r7, 112
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 153
LDI r12, 49
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
