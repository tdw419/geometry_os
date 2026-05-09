; DESCRIPTION: Composite: Creates a orange rectangular region at (129, 123) spanning 110 by 95 pixels then Sets a single magenta pixel at (163, 207) then Creates a white circular shape at (207, 93) with radius 49.
; PLAN: r0=129(x), r1=123(y), r2=110(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=163(x), r6=207(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=207(x), r11=93(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 123
LDI r2, 110
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 207
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 207
LDI r11, 93
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
