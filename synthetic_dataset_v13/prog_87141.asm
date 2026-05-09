; DESCRIPTION: Composite: Draws a purple circle centered at (155, 88) with radius 80 then Places a white line segment connecting (336, 32) to (185, 3) then Sets a single white pixel at (342, 240).
; PLAN: r0=155(x), r1=88(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=336(x1), r6=32(y1), r7=185(x2), r8=3(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=240(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 88
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 336
LDI r6, 32
LDI r7, 185
LDI r8, 3
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 240
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
