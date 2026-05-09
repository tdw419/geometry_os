; DESCRIPTION: Composite: Renders a green line between points (297, 173) and (259, 55) then Sets a single yellow pixel at (249, 200) then Creates a magenta circular shape at (189, 175) with radius 56.
; PLAN: r0=297(x1), r1=173(y1), r2=259(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=175(y), r12=56(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 173
LDI r2, 259
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 189
LDI r11, 175
LDI r12, 56
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
