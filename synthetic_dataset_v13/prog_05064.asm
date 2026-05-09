; DESCRIPTION: Composite: Places a yellow circle of radius 20 at center (347, 92) then Places a orange line segment connecting (109, 143) to (483, 157) then Sets a single orange pixel at (456, 30).
; PLAN: r0=347(x), r1=92(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x1), r6=143(y1), r7=483(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=456(x), r11=30(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 92
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 143
LDI r7, 483
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 456
LDI r11, 30
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
