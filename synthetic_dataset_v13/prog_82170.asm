; DESCRIPTION: Composite: Sets a single blue pixel at (142, 82) then Places a purple line segment connecting (448, 185) to (436, 233) then Places a purple circle of radius 20 at center (182, 38).
; PLAN: r0=142(x), r1=82(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=448(x1), r6=185(y1), r7=436(x2), r8=233(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=38(y), r12=20(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 82
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 448
LDI r6, 185
LDI r7, 436
LDI r8, 233
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 38
LDI r12, 20
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
