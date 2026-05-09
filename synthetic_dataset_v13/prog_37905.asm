; DESCRIPTION: Composite: Creates a magenta rectangular region at (344, 46) spanning 87 by 78 pixels then Creates a purple circular shape at (172, 80) with radius 56 then Places a black dot at position (55, 171).
; PLAN: r0=344(x), r1=46(y), r2=87(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=80(y), r7=56(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=171(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 46
LDI r2, 87
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 80
LDI r7, 56
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 171
LDI r12, 0x000000
PSET r10, r11, r12
HALT
