; DESCRIPTION: Composite: Places a cyan dot at position (133, 64) then Places a magenta line segment connecting (97, 182) to (48, 77) then Creates a green circular shape at (287, 201) with radius 22.
; PLAN: r0=133(x), r1=64(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=97(x1), r6=182(y1), r7=48(x2), r8=77(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=287(x), r11=201(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 64
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 97
LDI r6, 182
LDI r7, 48
LDI r8, 77
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 201
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
