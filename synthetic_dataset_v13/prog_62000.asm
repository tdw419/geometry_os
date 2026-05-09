; DESCRIPTION: Composite: Places a white line segment connecting (40, 189) to (416, 140) then Sets a single cyan pixel at (400, 232) then Creates a blue circular shape at (378, 32) with radius 18.
; PLAN: r0=40(x1), r1=189(y1), r2=416(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=232(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=378(x), r11=32(y), r12=18(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 40
LDI r1, 189
LDI r2, 416
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 232
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 378
LDI r11, 32
LDI r12, 18
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
