; DESCRIPTION: Composite: Places a orange dot at position (131, 183) then Places a purple line segment connecting (326, 144) to (248, 45) then Creates a orange circular shape at (340, 161) with radius 76.
; PLAN: r0=131(x), r1=183(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=326(x1), r6=144(y1), r7=248(x2), r8=45(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=161(y), r12=76(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 131
LDI r1, 183
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 326
LDI r6, 144
LDI r7, 248
LDI r8, 45
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 161
LDI r12, 76
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
