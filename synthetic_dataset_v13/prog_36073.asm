; DESCRIPTION: Composite: Sets a single green pixel at (442, 141) then Renders a purple line between points (94, 30) and (418, 175) then Places a black circle of radius 17 at center (114, 101).
; PLAN: r0=442(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=94(x1), r6=30(y1), r7=418(x2), r8=175(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=101(y), r12=17(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 442
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 94
LDI r6, 30
LDI r7, 418
LDI r8, 175
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 101
LDI r12, 17
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
