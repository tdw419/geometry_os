; DESCRIPTION: Composite: Creates a purple circular shape at (300, 206) with radius 45 then Places a black dot at position (254, 186) then Places a yellow line segment connecting (477, 24) to (339, 201).
; PLAN: r0=300(x), r1=206(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=186(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=477(x1), r11=24(y1), r12=339(x2), r13=201(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 206
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 186
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 477
LDI r11, 24
LDI r12, 339
LDI r13, 201
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
