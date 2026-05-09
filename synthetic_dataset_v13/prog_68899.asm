; DESCRIPTION: Composite: Places a black line segment connecting (252, 229) to (201, 19) then Creates a purple circular shape at (179, 174) with radius 71 then Places a orange dot at position (45, 49).
; PLAN: r0=252(x1), r1=229(y1), r2=201(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=174(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x), r11=49(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 229
LDI r2, 201
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 174
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 49
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
