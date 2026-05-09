; DESCRIPTION: Composite: Sets a single purple pixel at (363, 119) then Draws a blue circle centered at (226, 163) with radius 56 then Places a green line segment connecting (444, 62) to (440, 9).
; PLAN: r0=363(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=163(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=444(x1), r11=62(y1), r12=440(x2), r13=9(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 163
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 444
LDI r11, 62
LDI r12, 440
LDI r13, 9
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
