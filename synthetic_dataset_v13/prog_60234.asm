; DESCRIPTION: Composite: Sets a single black pixel at (450, 199) then Draws a green circle centered at (163, 192) with radius 16 then Renders a black line between points (430, 43) and (430, 170).
; PLAN: r0=450(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=192(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x1), r11=43(y1), r12=430(x2), r13=170(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 163
LDI r6, 192
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 43
LDI r12, 430
LDI r13, 170
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
