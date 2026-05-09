; DESCRIPTION: Composite: Places a orange dot at position (163, 123) then Renders a green line between points (129, 146) and (353, 34) then Creates a black circular shape at (294, 124) with radius 55.
; PLAN: r0=163(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=129(x1), r6=146(y1), r7=353(x2), r8=34(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=124(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 129
LDI r6, 146
LDI r7, 353
LDI r8, 34
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 124
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
