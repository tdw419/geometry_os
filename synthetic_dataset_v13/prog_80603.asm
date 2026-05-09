; DESCRIPTION: Composite: Creates a blue circular shape at (390, 153) with radius 48 then Sets a single white pixel at (181, 100) then Renders a blue line between points (378, 52) and (285, 248).
; PLAN: r0=390(x), r1=153(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=378(x1), r11=52(y1), r12=285(x2), r13=248(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 153
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 378
LDI r11, 52
LDI r12, 285
LDI r13, 248
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
