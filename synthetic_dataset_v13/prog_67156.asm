; DESCRIPTION: Composite: Renders a yellow box of size 20x103 starting at (373, 121) then Creates a purple circular shape at (381, 96) with radius 41 then Sets a single magenta pixel at (204, 105).
; PLAN: r0=373(x), r1=121(y), r2=20(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=381(x), r6=96(y), r7=41(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=204(x), r11=105(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 121
LDI r2, 20
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 96
LDI r7, 41
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 204
LDI r11, 105
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
