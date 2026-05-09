; DESCRIPTION: Composite: Sets a single black pixel at (288, 54) then Renders a purple line between points (332, 141) and (111, 21) then Renders a purple disk with center (106, 200) and radius 26.
; PLAN: r0=288(x), r1=54(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=332(x1), r6=141(y1), r7=111(x2), r8=21(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=106(x), r11=200(y), r12=26(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 54
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 141
LDI r7, 111
LDI r8, 21
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 200
LDI r12, 26
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
