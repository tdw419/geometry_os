; DESCRIPTION: Composite: Places a blue line segment connecting (269, 6) to (377, 179) then Creates a red circular shape at (378, 147) with radius 23 then Sets a single orange pixel at (472, 63).
; PLAN: r0=269(x1), r1=6(y1), r2=377(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=147(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x), r11=63(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 269
LDI r1, 6
LDI r2, 377
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 147
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 63
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
