; DESCRIPTION: Composite: Renders a black line between points (365, 40) and (364, 21) then Sets a single blue pixel at (293, 93) then Creates a magenta circular shape at (245, 117) with radius 53.
; PLAN: r0=365(x1), r1=40(y1), r2=364(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=93(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=117(y), r12=53(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 40
LDI r2, 364
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 93
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 245
LDI r11, 117
LDI r12, 53
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
