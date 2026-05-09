; DESCRIPTION: Composite: Draws a red circle centered at (483, 191) with radius 25 then Sets a single blue pixel at (282, 151) then Places a black line segment connecting (144, 73) to (303, 29).
; PLAN: r0=483(x), r1=191(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=151(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=144(x1), r11=73(y1), r12=303(x2), r13=29(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 191
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 151
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 144
LDI r11, 73
LDI r12, 303
LDI r13, 29
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
