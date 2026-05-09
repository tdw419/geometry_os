; DESCRIPTION: Composite: Sets a single magenta pixel at (318, 79) then Places a blue line segment connecting (341, 7) to (112, 95) then Creates a blue circular shape at (183, 124) with radius 27.
; PLAN: r0=318(x), r1=79(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=341(x1), r6=7(y1), r7=112(x2), r8=95(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=124(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 318
LDI r1, 79
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 341
LDI r6, 7
LDI r7, 112
LDI r8, 95
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 124
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
