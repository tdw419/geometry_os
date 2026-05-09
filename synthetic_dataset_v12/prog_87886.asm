; DESCRIPTION: Composite: Sets a single black pixel at (391, 2) then Renders a black disk with center (319, 152) and radius 75 then Places a purple line segment connecting (194, 127) to (257, 95).
; PLAN: r0=391(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=152(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x1), r11=127(y1), r12=257(x2), r13=95(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 391
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 319
LDI r6, 152
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 127
LDI r12, 257
LDI r13, 95
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
