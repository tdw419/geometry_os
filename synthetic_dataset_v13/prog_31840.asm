; DESCRIPTION: Composite: Sets a single white pixel at (142, 131) then Places a orange line segment connecting (238, 73) to (508, 23) then Creates a orange circular shape at (223, 165) with radius 11.
; PLAN: r0=142(x), r1=131(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=238(x1), r6=73(y1), r7=508(x2), r8=23(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=165(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 131
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 238
LDI r6, 73
LDI r7, 508
LDI r8, 23
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 165
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
