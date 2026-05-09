; DESCRIPTION: Composite: Creates a blue circular shape at (95, 131) with radius 75 then Places a orange line segment connecting (378, 200) to (275, 10) then Sets a single yellow pixel at (283, 26).
; PLAN: r0=95(x), r1=131(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=378(x1), r6=200(y1), r7=275(x2), r8=10(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=283(x), r11=26(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 95
LDI r1, 131
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 378
LDI r6, 200
LDI r7, 275
LDI r8, 10
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 26
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
