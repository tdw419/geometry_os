; DESCRIPTION: Composite: Draws a yellow circle centered at (237, 137) with radius 79 then Places a red line segment connecting (47, 214) to (462, 119) then Sets a single red pixel at (279, 211).
; PLAN: r0=237(x), r1=137(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x1), r6=214(y1), r7=462(x2), r8=119(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=211(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 137
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 214
LDI r7, 462
LDI r8, 119
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 211
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
