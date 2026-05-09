; DESCRIPTION: Composite: Creates a white circular shape at (118, 137) with radius 67 then Creates a white rectangular region at (115, 135) spanning 58 by 107 pixels then Places a black dot at position (51, 26).
; PLAN: r0=118(x), r1=137(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=135(y), r7=58(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=51(x), r11=26(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 137
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 135
LDI r7, 58
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 26
LDI r12, 0x000000
PSET r10, r11, r12
HALT
