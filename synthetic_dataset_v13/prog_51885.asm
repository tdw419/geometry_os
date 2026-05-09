; DESCRIPTION: Composite: Places a black line segment connecting (355, 108) to (444, 147) then Places a white dot at position (239, 150) then Creates a black circular shape at (83, 99) with radius 58.
; PLAN: r0=355(x1), r1=108(y1), r2=444(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=150(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=99(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 108
LDI r2, 444
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 150
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 83
LDI r11, 99
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
