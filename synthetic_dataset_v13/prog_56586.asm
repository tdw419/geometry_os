; DESCRIPTION: Composite: Sets a single black pixel at (51, 41) then Places a white line segment connecting (455, 33) to (511, 238) then Renders a yellow disk with center (69, 84) and radius 55.
; PLAN: r0=51(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=455(x1), r6=33(y1), r7=511(x2), r8=238(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=84(y), r12=55(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 41
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 455
LDI r6, 33
LDI r7, 511
LDI r8, 238
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 84
LDI r12, 55
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
