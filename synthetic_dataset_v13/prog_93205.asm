; DESCRIPTION: Composite: Sets a single black pixel at (437, 241) then Creates a black circular shape at (406, 141) with radius 72 then Creates a white rectangular region at (153, 46) spanning 96 by 71 pixels.
; PLAN: r0=437(x), r1=241(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=406(x), r6=141(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=153(x), r11=46(y), r12=96(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 437
LDI r1, 241
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 406
LDI r6, 141
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 153
LDI r11, 46
LDI r12, 96
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
