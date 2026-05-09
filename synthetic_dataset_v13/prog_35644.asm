; DESCRIPTION: Composite: Draws a green circle centered at (238, 88) with radius 80 then Places a purple line segment connecting (347, 216) to (355, 250).
; PLAN: r0=238(x), r1=88(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x1), r6=216(y1), r7=355(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 88
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 216
LDI r7, 355
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
