; DESCRIPTION: Composite: Draws a purple line from (265, 189) to (458, 95) then Draws a yellow circle centered at (145, 66) with radius 17 then Places a black dot at position (237, 137).
; PLAN: r0=265(x1), r1=189(y1), r2=458(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=66(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 265
LDI r1, 189
LDI r2, 458
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 66
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
