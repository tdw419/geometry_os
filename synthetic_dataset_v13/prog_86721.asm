; DESCRIPTION: Composite: Sets a single black pixel at (229, 87) then Places a yellow line segment connecting (18, 214) to (95, 157) then Creates a yellow circular shape at (212, 121) with radius 73.
; PLAN: r0=229(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=18(x1), r6=214(y1), r7=95(x2), r8=157(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=121(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 18
LDI r6, 214
LDI r7, 95
LDI r8, 157
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 121
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
