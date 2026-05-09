; DESCRIPTION: Composite: Renders a green line between points (286, 48) and (201, 166) then Creates a cyan circular shape at (339, 147) with radius 58 then Sets a single blue pixel at (486, 101).
; PLAN: r0=286(x1), r1=48(y1), r2=201(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=147(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x), r11=101(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 48
LDI r2, 201
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 147
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 101
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
