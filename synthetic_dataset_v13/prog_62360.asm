; DESCRIPTION: Composite: Draws a red line from (357, 211) to (452, 126) then Places a purple circle of radius 80 at center (119, 101) then Sets a single blue pixel at (440, 111).
; PLAN: r0=357(x1), r1=211(y1), r2=452(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=101(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=440(x), r11=111(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 211
LDI r2, 452
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 101
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 440
LDI r11, 111
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
