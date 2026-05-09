; DESCRIPTION: Composite: Draws a red line from (2, 198) to (505, 36) then Renders a black disk with center (64, 182) and radius 44 then Sets a single orange pixel at (77, 166).
; PLAN: r0=2(x1), r1=198(y1), r2=505(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=182(y), r7=44(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=166(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 2
LDI r1, 198
LDI r2, 505
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 182
LDI r7, 44
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 166
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
