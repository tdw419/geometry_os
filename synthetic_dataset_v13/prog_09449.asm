; DESCRIPTION: Composite: Renders a orange line between points (499, 201) and (279, 212) then Sets a single purple pixel at (402, 62) then Places a green circle of radius 53 at center (198, 109).
; PLAN: r0=499(x1), r1=201(y1), r2=279(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=62(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=198(x), r11=109(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 201
LDI r2, 279
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 62
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 198
LDI r11, 109
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
