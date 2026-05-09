; DESCRIPTION: Composite: Renders a yellow disk with center (136, 92) and radius 75 then Renders a green line between points (322, 199) and (343, 16) then Places a blue dot at position (45, 245).
; PLAN: r0=136(x), r1=92(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=199(y1), r7=343(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=245(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 136
LDI r1, 92
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 199
LDI r7, 343
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 245
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
