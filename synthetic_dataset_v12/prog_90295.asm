; DESCRIPTION: Composite: Creates a purple circular shape at (159, 31) with radius 27 then Draws a purple line from (314, 109) to (415, 86) then Sets a single blue pixel at (130, 160).
; PLAN: r0=159(x), r1=31(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=109(y1), r7=415(x2), r8=86(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=160(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 31
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 109
LDI r7, 415
LDI r8, 86
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 160
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
