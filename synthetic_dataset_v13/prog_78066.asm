; DESCRIPTION: Composite: Places a purple dot at position (482, 53) then Places a orange line segment connecting (437, 136) to (36, 51) then Creates a black circular shape at (395, 171) with radius 57.
; PLAN: r0=482(x), r1=53(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=437(x1), r6=136(y1), r7=36(x2), r8=51(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=171(y), r12=57(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 482
LDI r1, 53
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 136
LDI r7, 36
LDI r8, 51
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 171
LDI r12, 57
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
