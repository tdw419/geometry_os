; DESCRIPTION: Composite: Creates a cyan rectangular region at (174, 121) spanning 114 by 88 pixels then Sets a single red pixel at (360, 101) then Creates a green circular shape at (218, 182) with radius 36.
; PLAN: r0=174(x), r1=121(y), r2=114(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=218(x), r11=182(y), r12=36(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 121
LDI r2, 114
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 218
LDI r11, 182
LDI r12, 36
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
