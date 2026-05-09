; DESCRIPTION: Composite: Places a black circle of radius 14 at center (483, 188) then Renders a orange line between points (141, 229) and (173, 62) then Sets a single blue pixel at (26, 145).
; PLAN: r0=483(x), r1=188(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=229(y1), r7=173(x2), r8=62(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=145(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 188
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 229
LDI r7, 173
LDI r8, 62
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 145
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
