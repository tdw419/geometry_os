; DESCRIPTION: Composite: Renders a black disk with center (380, 145) and radius 17 then Sets a single orange pixel at (444, 176) then Places a yellow line segment connecting (273, 37) to (459, 121).
; PLAN: r0=380(x), r1=145(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=176(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=273(x1), r11=37(y1), r12=459(x2), r13=121(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 145
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 176
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 273
LDI r11, 37
LDI r12, 459
LDI r13, 121
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
