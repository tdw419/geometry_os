; DESCRIPTION: Composite: Places a purple dot at position (424, 104) then Creates a purple circular shape at (357, 150) with radius 76 then Renders a purple line between points (354, 140) and (112, 208).
; PLAN: r0=424(x), r1=104(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=150(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=354(x1), r11=140(y1), r12=112(x2), r13=208(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 104
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 150
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 354
LDI r11, 140
LDI r12, 112
LDI r13, 208
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
