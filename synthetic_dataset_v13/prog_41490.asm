; DESCRIPTION: Composite: Sets a single blue pixel at (334, 67) then Places a green circle of radius 12 at center (381, 30) then Renders a orange line between points (136, 118) and (129, 80).
; PLAN: r0=334(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=381(x), r6=30(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=136(x1), r11=118(y1), r12=129(x2), r13=80(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 381
LDI r6, 30
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 136
LDI r11, 118
LDI r12, 129
LDI r13, 80
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
