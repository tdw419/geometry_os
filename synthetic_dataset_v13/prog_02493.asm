; DESCRIPTION: Composite: Sets a single white pixel at (118, 254) then Places a black line segment connecting (469, 148) to (309, 200) then Creates a yellow circular shape at (153, 84) with radius 54.
; PLAN: r0=118(x), r1=254(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=469(x1), r6=148(y1), r7=309(x2), r8=200(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=84(y), r12=54(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 254
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 469
LDI r6, 148
LDI r7, 309
LDI r8, 200
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 84
LDI r12, 54
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
