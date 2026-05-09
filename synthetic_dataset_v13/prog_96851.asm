; DESCRIPTION: Composite: Draws a purple circle centered at (334, 156) with radius 71 then Draws a white line from (10, 112) to (151, 191) then Sets a single green pixel at (58, 237).
; PLAN: r0=334(x), r1=156(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x1), r6=112(y1), r7=151(x2), r8=191(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=58(x), r11=237(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 156
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 112
LDI r7, 151
LDI r8, 191
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 237
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
