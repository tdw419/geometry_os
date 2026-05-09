; DESCRIPTION: Composite: Places a red dot at position (311, 155) then Places a red circle of radius 77 at center (124, 142) then Creates a orange rectangular region at (303, 109) spanning 115 by 31 pixels.
; PLAN: r0=311(x), r1=155(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=142(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x), r11=109(y), r12=115(width), r13=31(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 311
LDI r1, 155
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 124
LDI r6, 142
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 109
LDI r12, 115
LDI r13, 31
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
