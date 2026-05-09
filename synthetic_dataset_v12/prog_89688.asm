; DESCRIPTION: Composite: Places a black line segment connecting (280, 169) to (9, 133) then Places a purple circle of radius 80 at center (191, 147).
; PLAN: r0=280(x1), r1=169(y1), r2=9(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=147(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 169
LDI r2, 9
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 147
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
