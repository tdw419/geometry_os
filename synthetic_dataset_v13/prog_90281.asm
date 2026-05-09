; DESCRIPTION: Composite: Renders a green line between points (200, 31) and (181, 191) then Places a blue dot at position (43, 83) then Creates a yellow circular shape at (425, 48) with radius 27.
; PLAN: r0=200(x1), r1=31(y1), r2=181(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=83(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=48(y), r12=27(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 200
LDI r1, 31
LDI r2, 181
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 83
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 425
LDI r11, 48
LDI r12, 27
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
