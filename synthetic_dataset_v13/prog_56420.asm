; DESCRIPTION: Composite: Creates a yellow circular shape at (90, 131) with radius 35 then Places a black line segment connecting (260, 165) to (418, 58) then Sets a single magenta pixel at (26, 170).
; PLAN: r0=90(x), r1=131(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=165(y1), r7=418(x2), r8=58(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=26(x), r11=170(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 90
LDI r1, 131
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 165
LDI r7, 418
LDI r8, 58
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 26
LDI r11, 170
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
