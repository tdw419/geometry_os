; DESCRIPTION: Composite: Places a yellow line segment connecting (335, 139) to (483, 84) then Creates a yellow circular shape at (187, 68) with radius 47 then Sets a single blue pixel at (199, 118).
; PLAN: r0=335(x1), r1=139(y1), r2=483(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=68(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x), r11=118(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 139
LDI r2, 483
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 68
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 118
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
