; DESCRIPTION: Composite: Places a red line segment connecting (342, 254) to (259, 191) then Draws a purple circle centered at (441, 235) with radius 17 then Sets a single black pixel at (403, 146).
; PLAN: r0=342(x1), r1=254(y1), r2=259(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=235(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=403(x), r11=146(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 254
LDI r2, 259
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 235
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 403
LDI r11, 146
LDI r12, 0x000000
PSET r10, r11, r12
HALT
