; DESCRIPTION: Composite: Places a black line segment connecting (421, 186) to (287, 109) then Creates a red circular shape at (277, 83) with radius 48 then Sets a single green pixel at (498, 109).
; PLAN: r0=421(x1), r1=186(y1), r2=287(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=83(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=109(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 186
LDI r2, 287
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 83
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 109
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
