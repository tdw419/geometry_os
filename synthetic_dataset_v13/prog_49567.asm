; DESCRIPTION: Composite: Places a purple line segment connecting (369, 46) to (163, 61) then Renders a green disk with center (172, 167) and radius 80 then Sets a single cyan pixel at (58, 130).
; PLAN: r0=369(x1), r1=46(y1), r2=163(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=167(y), r7=80(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=130(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 369
LDI r1, 46
LDI r2, 163
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 167
LDI r7, 80
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 130
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
