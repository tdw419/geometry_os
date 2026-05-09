; DESCRIPTION: Composite: Sets a single purple pixel at (281, 232) then Creates a blue circular shape at (197, 86) with radius 16 then Renders a yellow line between points (347, 105) and (325, 49).
; PLAN: r0=281(x), r1=232(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=86(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=347(x1), r11=105(y1), r12=325(x2), r13=49(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 232
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 197
LDI r6, 86
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 347
LDI r11, 105
LDI r12, 325
LDI r13, 49
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
