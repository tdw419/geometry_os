; DESCRIPTION: Composite: Sets a single black pixel at (177, 200) then Creates a white circular shape at (373, 89) with radius 18 then Creates a orange rectangular region at (118, 133) spanning 119 by 51 pixels.
; PLAN: r0=177(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=89(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=118(x), r11=133(y), r12=119(width), r13=51(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 373
LDI r6, 89
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 118
LDI r11, 133
LDI r12, 119
LDI r13, 51
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
