; DESCRIPTION: Composite: Creates a black rectangular region at (139, 75) spanning 63 by 70 pixels then Creates a yellow circular shape at (240, 158) with radius 79 then Sets a single white pixel at (191, 83).
; PLAN: r0=139(x), r1=75(y), r2=63(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=158(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x), r11=83(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 75
LDI r2, 63
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 158
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 83
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
