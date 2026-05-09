; DESCRIPTION: Composite: Places a purple dot at position (61, 21) then Places a purple line segment connecting (419, 151) to (255, 28) then Creates a blue circular shape at (244, 179) with radius 49.
; PLAN: r0=61(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=419(x1), r6=151(y1), r7=255(x2), r8=28(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=244(x), r11=179(y), r12=49(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 419
LDI r6, 151
LDI r7, 255
LDI r8, 28
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 179
LDI r12, 49
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
