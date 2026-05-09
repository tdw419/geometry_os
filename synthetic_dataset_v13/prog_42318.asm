; DESCRIPTION: Composite: Sets a single magenta pixel at (458, 6) then Creates a yellow circular shape at (389, 100) with radius 71 then Renders a yellow line between points (139, 2) and (318, 244).
; PLAN: r0=458(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=100(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x1), r11=2(y1), r12=318(x2), r13=244(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 100
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 2
LDI r12, 318
LDI r13, 244
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
