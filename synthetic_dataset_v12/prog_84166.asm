; DESCRIPTION: Composite: Places a green dot at position (58, 171) then Places a white line segment connecting (350, 254) to (318, 86) then Places a yellow circle of radius 70 at center (378, 79).
; PLAN: r0=58(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=350(x1), r6=254(y1), r7=318(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=79(y), r12=70(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 58
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 350
LDI r6, 254
LDI r7, 318
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 79
LDI r12, 70
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
