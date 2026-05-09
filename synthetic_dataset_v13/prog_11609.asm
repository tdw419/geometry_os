; DESCRIPTION: Composite: Renders a black box of size 17x56 starting at (235, 104) then Sets a single magenta pixel at (100, 53) then Creates a purple circular shape at (138, 113) with radius 68.
; PLAN: r0=235(x), r1=104(y), r2=17(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=53(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=113(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 104
LDI r2, 17
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 53
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 113
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
