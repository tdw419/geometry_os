; DESCRIPTION: Composite: Sets a single yellow pixel at (148, 237) then Places a white line segment connecting (246, 27) to (264, 147) then Draws a purple circle centered at (153, 108) with radius 53.
; PLAN: r0=148(x), r1=237(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=27(y1), r7=264(x2), r8=147(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=108(y), r12=53(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 148
LDI r1, 237
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 246
LDI r6, 27
LDI r7, 264
LDI r8, 147
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 108
LDI r12, 53
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
