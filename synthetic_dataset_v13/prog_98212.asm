; DESCRIPTION: Composite: Creates a purple circular shape at (421, 165) with radius 66 then Renders a white line between points (79, 195) and (64, 101) then Sets a single red pixel at (315, 58).
; PLAN: r0=421(x), r1=165(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x1), r6=195(y1), r7=64(x2), r8=101(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=315(x), r11=58(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 165
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 195
LDI r7, 64
LDI r8, 101
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 58
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
