; DESCRIPTION: Composite: Renders a purple line between points (304, 37) and (260, 87) then Creates a blue circular shape at (148, 92) with radius 78 then Sets a single white pixel at (187, 23).
; PLAN: r0=304(x1), r1=37(y1), r2=260(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=92(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=23(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 37
LDI r2, 260
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 92
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 23
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
