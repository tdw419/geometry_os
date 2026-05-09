; DESCRIPTION: Composite: Places a purple line segment connecting (156, 249) to (371, 6) then Sets a single yellow pixel at (445, 117) then Creates a white circular shape at (435, 123) with radius 59.
; PLAN: r0=156(x1), r1=249(y1), r2=371(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=445(x), r6=117(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=435(x), r11=123(y), r12=59(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 156
LDI r1, 249
LDI r2, 371
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 117
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 435
LDI r11, 123
LDI r12, 59
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
