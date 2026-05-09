; DESCRIPTION: Composite: Places a cyan dot at position (477, 61) then Places a blue line segment connecting (476, 177) to (225, 71) then Creates a black circular shape at (74, 119) with radius 36.
; PLAN: r0=477(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=177(y1), r7=225(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=119(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 61
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 476
LDI r6, 177
LDI r7, 225
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 119
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
