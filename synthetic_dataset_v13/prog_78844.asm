; DESCRIPTION: Composite: Places a purple line segment connecting (504, 182) to (358, 221) then Draws a white circle centered at (117, 107) with radius 37 then Sets a single blue pixel at (161, 145).
; PLAN: r0=504(x1), r1=182(y1), r2=358(x2), r3=221(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=107(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=145(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 504
LDI r1, 182
LDI r2, 358
LDI r3, 221
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 107
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 145
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
