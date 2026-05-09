; DESCRIPTION: Composite: Places a yellow dot at position (421, 24) then Places a red line segment connecting (115, 183) to (233, 144) then Creates a cyan circular shape at (153, 191) with radius 61.
; PLAN: r0=421(x), r1=24(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=115(x1), r6=183(y1), r7=233(x2), r8=144(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=191(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 24
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 115
LDI r6, 183
LDI r7, 233
LDI r8, 144
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 191
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
