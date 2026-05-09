; DESCRIPTION: Composite: Draws a white circle centered at (177, 94) with radius 35 then Draws a purple line from (103, 43) to (427, 114) then Sets a single yellow pixel at (141, 90).
; PLAN: r0=177(x), r1=94(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x1), r6=43(y1), r7=427(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=141(x), r11=90(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 94
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 43
LDI r7, 427
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 90
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
