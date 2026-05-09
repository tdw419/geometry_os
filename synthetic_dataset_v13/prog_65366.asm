; DESCRIPTION: Composite: Places a red line segment connecting (140, 74) to (109, 61) then Creates a white circular shape at (325, 112) with radius 48 then Sets a single yellow pixel at (142, 218).
; PLAN: r0=140(x1), r1=74(y1), r2=109(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=112(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=142(x), r11=218(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 74
LDI r2, 109
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 112
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 142
LDI r11, 218
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
