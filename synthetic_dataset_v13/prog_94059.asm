; DESCRIPTION: Composite: Creates a black circular shape at (491, 11) with radius 10 then Sets a single purple pixel at (314, 15) then Draws a red line from (109, 143) to (253, 48).
; PLAN: r0=491(x), r1=11(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=15(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=109(x1), r11=143(y1), r12=253(x2), r13=48(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 11
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 15
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 109
LDI r11, 143
LDI r12, 253
LDI r13, 48
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
