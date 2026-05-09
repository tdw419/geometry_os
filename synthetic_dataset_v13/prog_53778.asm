; DESCRIPTION: Composite: Draws a white line from (58, 220) to (424, 40) then Sets a single green pixel at (343, 52) then Creates a blue circular shape at (82, 104) with radius 58.
; PLAN: r0=58(x1), r1=220(y1), r2=424(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=52(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=82(x), r11=104(y), r12=58(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 220
LDI r2, 424
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 52
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 82
LDI r11, 104
LDI r12, 58
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
