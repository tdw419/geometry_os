; DESCRIPTION: Composite: Places a blue dot at position (381, 94) then Creates a green circular shape at (121, 62) with radius 49 then Places a blue line segment connecting (140, 57) to (147, 201).
; PLAN: r0=381(x), r1=94(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=62(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x1), r11=57(y1), r12=147(x2), r13=201(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 94
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 121
LDI r6, 62
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 57
LDI r12, 147
LDI r13, 201
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
