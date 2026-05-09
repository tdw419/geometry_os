; DESCRIPTION: Composite: Sets a single purple pixel at (475, 44) then Places a purple line segment connecting (322, 192) to (185, 45) then Renders a white disk with center (337, 123) and radius 69.
; PLAN: r0=475(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=322(x1), r6=192(y1), r7=185(x2), r8=45(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=123(y), r12=69(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 192
LDI r7, 185
LDI r8, 45
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 123
LDI r12, 69
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
