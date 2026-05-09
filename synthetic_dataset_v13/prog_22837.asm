; DESCRIPTION: Composite: Renders a red disk with center (88, 99) and radius 72 then Sets a single white pixel at (189, 201) then Places a purple line segment connecting (235, 61) to (120, 170).
; PLAN: r0=88(x), r1=99(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=189(x), r6=201(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=235(x1), r11=61(y1), r12=120(x2), r13=170(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 99
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 189
LDI r6, 201
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 235
LDI r11, 61
LDI r12, 120
LDI r13, 170
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
