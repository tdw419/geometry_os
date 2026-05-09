; DESCRIPTION: Composite: Creates a black circular shape at (93, 156) with radius 47 then Renders a black line between points (374, 90) and (335, 236) then Sets a single blue pixel at (151, 211).
; PLAN: r0=93(x), r1=156(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x1), r6=90(y1), r7=335(x2), r8=236(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=211(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 93
LDI r1, 156
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 90
LDI r7, 335
LDI r8, 236
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 211
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
