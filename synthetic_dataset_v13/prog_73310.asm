; DESCRIPTION: Composite: Draws a purple line from (325, 199) to (457, 204) then Draws a white circle centered at (289, 157) with radius 20 then Sets a single cyan pixel at (114, 51).
; PLAN: r0=325(x1), r1=199(y1), r2=457(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=157(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=114(x), r11=51(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 199
LDI r2, 457
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 157
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 114
LDI r11, 51
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
