; DESCRIPTION: Composite: Draws a black circle centered at (55, 103) with radius 39 then Places a red line segment connecting (248, 66) to (147, 211) then Sets a single red pixel at (260, 247).
; PLAN: r0=55(x), r1=103(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x1), r6=66(y1), r7=147(x2), r8=211(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=247(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 103
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 66
LDI r7, 147
LDI r8, 211
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 247
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
