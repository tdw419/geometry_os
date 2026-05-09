; DESCRIPTION: Composite: Places a magenta dot at position (202, 7) then Renders a purple line between points (472, 5) and (495, 56) then Creates a black circular shape at (460, 174) with radius 41.
; PLAN: r0=202(x), r1=7(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=472(x1), r6=5(y1), r7=495(x2), r8=56(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=174(y), r12=41(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 7
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 472
LDI r6, 5
LDI r7, 495
LDI r8, 56
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 174
LDI r12, 41
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
