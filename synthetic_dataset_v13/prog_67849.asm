; DESCRIPTION: Composite: Sets a single blue pixel at (162, 130) then Creates a blue circular shape at (424, 205) with radius 51 then Renders a white line between points (332, 157) and (290, 87).
; PLAN: r0=162(x), r1=130(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=424(x), r6=205(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=332(x1), r11=157(y1), r12=290(x2), r13=87(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 130
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 424
LDI r6, 205
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 332
LDI r11, 157
LDI r12, 290
LDI r13, 87
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
