; DESCRIPTION: Composite: Draws a black line from (407, 177) to (505, 141) then Creates a orange circular shape at (440, 147) with radius 57 then Sets a single red pixel at (71, 237).
; PLAN: r0=407(x1), r1=177(y1), r2=505(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=147(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=237(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 407
LDI r1, 177
LDI r2, 505
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 147
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 237
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
