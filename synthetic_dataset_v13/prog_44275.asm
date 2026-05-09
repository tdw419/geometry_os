; DESCRIPTION: Composite: Draws a purple circle centered at (229, 107) with radius 33 then Renders a purple line between points (423, 18) and (140, 91) then Sets a single blue pixel at (101, 73).
; PLAN: r0=229(x), r1=107(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x1), r6=18(y1), r7=140(x2), r8=91(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=73(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 107
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 18
LDI r7, 140
LDI r8, 91
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 73
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
