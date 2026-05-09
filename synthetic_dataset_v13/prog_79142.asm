; DESCRIPTION: Composite: Renders a orange line between points (422, 146) and (166, 66) then Renders a black disk with center (81, 135) and radius 79 then Sets a single orange pixel at (498, 201).
; PLAN: r0=422(x1), r1=146(y1), r2=166(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=81(x), r6=135(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x), r11=201(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 146
LDI r2, 166
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 135
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 201
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
