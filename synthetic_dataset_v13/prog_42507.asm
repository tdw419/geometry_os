; DESCRIPTION: Composite: Places a purple circle of radius 40 at center (155, 143) then Places a black line segment connecting (411, 249) to (142, 147) then Sets a single cyan pixel at (112, 100).
; PLAN: r0=155(x), r1=143(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=249(y1), r7=142(x2), r8=147(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=100(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 143
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 249
LDI r7, 142
LDI r8, 147
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 100
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
