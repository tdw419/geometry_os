; DESCRIPTION: Composite: Draws a green circle centered at (45, 104) with radius 13 then Renders a yellow line between points (135, 226) and (323, 131) then Sets a single black pixel at (390, 206).
; PLAN: r0=45(x), r1=104(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x1), r6=226(y1), r7=323(x2), r8=131(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=206(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 104
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 226
LDI r7, 323
LDI r8, 131
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 206
LDI r12, 0x000000
PSET r10, r11, r12
HALT
