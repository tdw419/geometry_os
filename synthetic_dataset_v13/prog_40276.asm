; DESCRIPTION: Composite: Renders a black line between points (106, 137) and (276, 230) then Creates a magenta circular shape at (51, 199) with radius 40 then Sets a single white pixel at (293, 15).
; PLAN: r0=106(x1), r1=137(y1), r2=276(x2), r3=230(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=199(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=293(x), r11=15(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 137
LDI r2, 276
LDI r3, 230
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 199
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 293
LDI r11, 15
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
