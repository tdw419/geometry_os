; DESCRIPTION: Composite: Sets a single orange pixel at (143, 163) then Renders a yellow line between points (106, 27) and (173, 14) then Creates a black circular shape at (161, 92) with radius 60.
; PLAN: r0=143(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=27(y1), r7=173(x2), r8=14(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=92(y), r12=60(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 163
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 106
LDI r6, 27
LDI r7, 173
LDI r8, 14
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 92
LDI r12, 60
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
