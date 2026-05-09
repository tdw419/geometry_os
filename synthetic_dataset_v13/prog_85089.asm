; DESCRIPTION: Composite: Creates a green circular shape at (179, 33) with radius 23 then Places a purple line segment connecting (363, 110) to (476, 14).
; PLAN: r0=179(x), r1=33(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x1), r6=110(y1), r7=476(x2), r8=14(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 33
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 110
LDI r7, 476
LDI r8, 14
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
