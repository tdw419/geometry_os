; DESCRIPTION: Composite: Places a blue line segment connecting (456, 92) to (467, 71) then Sets a single blue pixel at (22, 68) then Creates a cyan circular shape at (129, 94) with radius 39.
; PLAN: r0=456(x1), r1=92(y1), r2=467(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=68(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=94(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 456
LDI r1, 92
LDI r2, 467
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 68
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 94
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
