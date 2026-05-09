; DESCRIPTION: Composite: Renders a green line between points (232, 191) and (63, 169) then Renders a yellow disk with center (268, 95) and radius 38.
; PLAN: r0=232(x1), r1=191(y1), r2=63(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=95(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 191
LDI r2, 63
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 95
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
