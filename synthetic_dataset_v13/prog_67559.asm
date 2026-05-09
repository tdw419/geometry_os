; DESCRIPTION: Composite: Sets a single green pixel at (258, 64) then Renders a black line between points (405, 17) and (223, 119) then Places a purple circle of radius 21 at center (251, 190).
; PLAN: r0=258(x), r1=64(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=405(x1), r6=17(y1), r7=223(x2), r8=119(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=251(x), r11=190(y), r12=21(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 258
LDI r1, 64
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 405
LDI r6, 17
LDI r7, 223
LDI r8, 119
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 251
LDI r11, 190
LDI r12, 21
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
