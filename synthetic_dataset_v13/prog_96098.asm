; DESCRIPTION: Composite: Places a yellow line segment connecting (175, 173) to (418, 100) then Renders a white disk with center (388, 77) and radius 75 then Sets a single blue pixel at (68, 105).
; PLAN: r0=175(x1), r1=173(y1), r2=418(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=77(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=105(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 173
LDI r2, 418
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 77
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 105
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
