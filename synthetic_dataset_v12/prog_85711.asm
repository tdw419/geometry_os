; DESCRIPTION: Composite: Sets a single orange pixel at (201, 202) then Creates a red rectangular region at (357, 151) spanning 59 by 42 pixels then Creates a blue circular shape at (147, 115) with radius 33.
; PLAN: r0=201(x), r1=202(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=151(y), r7=59(width), r8=42(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=115(y), r12=33(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 202
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 357
LDI r6, 151
LDI r7, 59
LDI r8, 42
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 115
LDI r12, 33
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
