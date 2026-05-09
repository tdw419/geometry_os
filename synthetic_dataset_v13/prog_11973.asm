; DESCRIPTION: Composite: Sets a single yellow pixel at (490, 41) then Places a yellow circle of radius 58 at center (112, 95) then Places a black line segment connecting (313, 206) to (189, 33).
; PLAN: r0=490(x), r1=41(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=95(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x1), r11=206(y1), r12=189(x2), r13=33(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 490
LDI r1, 41
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 112
LDI r6, 95
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 206
LDI r12, 189
LDI r13, 33
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
