; DESCRIPTION: Composite: Sets a single magenta pixel at (297, 112) then Creates a black rectangular region at (17, 108) spanning 35 by 120 pixels then Creates a black circular shape at (234, 102) with radius 17.
; PLAN: r0=297(x), r1=112(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=108(y), r7=35(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=102(y), r12=17(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 112
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 17
LDI r6, 108
LDI r7, 35
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 102
LDI r12, 17
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
