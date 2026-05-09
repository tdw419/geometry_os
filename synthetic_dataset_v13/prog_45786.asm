; DESCRIPTION: Composite: Places a red dot at position (232, 184) then Creates a black rectangular region at (296, 117) spanning 64 by 104 pixels then Creates a purple circular shape at (44, 149) with radius 35.
; PLAN: r0=232(x), r1=184(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=117(y), r7=64(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=44(x), r11=149(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 232
LDI r1, 184
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 296
LDI r6, 117
LDI r7, 64
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 149
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
