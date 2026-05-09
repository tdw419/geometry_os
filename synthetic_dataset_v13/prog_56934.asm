; DESCRIPTION: Composite: Sets a single blue pixel at (47, 185) then Places a purple circle of radius 49 at center (187, 66) then Renders a yellow line between points (280, 181) and (75, 106).
; PLAN: r0=47(x), r1=185(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=66(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x1), r11=181(y1), r12=75(x2), r13=106(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 185
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 66
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 181
LDI r12, 75
LDI r13, 106
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
