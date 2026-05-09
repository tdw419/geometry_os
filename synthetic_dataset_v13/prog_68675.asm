; DESCRIPTION: Composite: Draws a white line from (441, 71) to (506, 240) then Creates a black circular shape at (109, 100) with radius 65 then Places a purple dot at position (300, 78).
; PLAN: r0=441(x1), r1=71(y1), r2=506(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=100(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=300(x), r11=78(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 71
LDI r2, 506
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 100
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 300
LDI r11, 78
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
