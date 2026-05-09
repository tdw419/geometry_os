; DESCRIPTION: Composite: Creates a magenta circular shape at (447, 58) with radius 20 then Creates a yellow rectangular region at (79, 46) spanning 29 by 68 pixels then Sets a single orange pixel at (73, 37).
; PLAN: r0=447(x), r1=58(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=46(y), r7=29(width), r8=68(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=73(x), r11=37(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 58
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 46
LDI r7, 29
LDI r8, 68
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 37
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
