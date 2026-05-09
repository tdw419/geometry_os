; DESCRIPTION: Composite: Draws a red circle centered at (147, 191) with radius 43 then Sets a single red pixel at (260, 216) then Places a blue line segment connecting (402, 220) to (36, 48).
; PLAN: r0=147(x), r1=191(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=216(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=220(y1), r12=36(x2), r13=48(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 147
LDI r1, 191
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 216
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 402
LDI r11, 220
LDI r12, 36
LDI r13, 48
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
