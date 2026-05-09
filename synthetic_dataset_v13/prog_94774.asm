; DESCRIPTION: Composite: Sets a single red pixel at (363, 62) then Places a blue line segment connecting (251, 8) to (255, 4) then Creates a purple circular shape at (222, 64) with radius 35.
; PLAN: r0=363(x), r1=62(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=251(x1), r6=8(y1), r7=255(x2), r8=4(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=64(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 62
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 251
LDI r6, 8
LDI r7, 255
LDI r8, 4
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 64
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
