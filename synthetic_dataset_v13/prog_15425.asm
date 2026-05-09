; DESCRIPTION: Composite: Sets a single yellow pixel at (422, 62) then Draws a yellow line from (138, 45) to (254, 49) then Creates a black circular shape at (244, 182) with radius 18.
; PLAN: r0=422(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=138(x1), r6=45(y1), r7=254(x2), r8=49(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=182(y), r12=18(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 422
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 138
LDI r6, 45
LDI r7, 254
LDI r8, 49
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 182
LDI r12, 18
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
