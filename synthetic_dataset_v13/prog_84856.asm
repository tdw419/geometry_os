; DESCRIPTION: Composite: Renders a black line between points (348, 19) and (262, 23) then Creates a yellow rectangular region at (104, 112) spanning 73 by 20 pixels then Sets a single red pixel at (393, 189).
; PLAN: r0=348(x1), r1=19(y1), r2=262(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=112(y), r7=73(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x), r11=189(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 19
LDI r2, 262
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 112
LDI r7, 73
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 189
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
