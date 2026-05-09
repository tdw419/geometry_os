; DESCRIPTION: Composite: Renders a black line between points (436, 169) and (5, 104) then Places a green dot at position (289, 175) then Places a green circle of radius 19 at center (176, 80).
; PLAN: r0=436(x1), r1=169(y1), r2=5(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=175(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=80(y), r12=19(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 436
LDI r1, 169
LDI r2, 5
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 175
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 176
LDI r11, 80
LDI r12, 19
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
