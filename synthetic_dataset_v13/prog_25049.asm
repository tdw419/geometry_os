; DESCRIPTION: Composite: Draws a purple circle centered at (391, 182) with radius 29 then Draws a blue line from (343, 32) to (236, 183) then Sets a single yellow pixel at (225, 183).
; PLAN: r0=391(x), r1=182(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x1), r6=32(y1), r7=236(x2), r8=183(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=183(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 182
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 32
LDI r7, 236
LDI r8, 183
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 183
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
