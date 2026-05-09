; DESCRIPTION: Composite: Places a black dot at position (212, 202) then Places a black line segment connecting (332, 26) to (159, 160) then Creates a green circular shape at (453, 173) with radius 55.
; PLAN: r0=212(x), r1=202(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=332(x1), r6=26(y1), r7=159(x2), r8=160(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=453(x), r11=173(y), r12=55(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 212
LDI r1, 202
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 26
LDI r7, 159
LDI r8, 160
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 453
LDI r11, 173
LDI r12, 55
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
