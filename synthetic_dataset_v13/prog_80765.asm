; DESCRIPTION: Composite: Renders a red line between points (24, 15) and (441, 148) then Creates a white circular shape at (247, 157) with radius 22 then Sets a single blue pixel at (117, 129).
; PLAN: r0=24(x1), r1=15(y1), r2=441(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=157(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=129(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 15
LDI r2, 441
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 157
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 129
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
