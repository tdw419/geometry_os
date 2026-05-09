; DESCRIPTION: Composite: Sets a single green pixel at (9, 114) then Places a purple line segment connecting (198, 87) to (441, 43) then Draws a yellow circle centered at (413, 45) with radius 12.
; PLAN: r0=9(x), r1=114(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=198(x1), r6=87(y1), r7=441(x2), r8=43(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=413(x), r11=45(y), r12=12(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 114
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 198
LDI r6, 87
LDI r7, 441
LDI r8, 43
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 45
LDI r12, 12
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
