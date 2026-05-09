; DESCRIPTION: Composite: Sets a single orange pixel at (297, 110) then Draws a black circle centered at (139, 83) with radius 68 then Places a black line segment connecting (45, 119) to (452, 116).
; PLAN: r0=297(x), r1=110(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=83(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x1), r11=119(y1), r12=452(x2), r13=116(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 110
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 139
LDI r6, 83
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 119
LDI r12, 452
LDI r13, 116
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
