; DESCRIPTION: Composite: Creates a cyan circular shape at (261, 149) with radius 11 then Creates a yellow rectangular region at (172, 207) spanning 56 by 44 pixels then Sets a single black pixel at (410, 83).
; PLAN: r0=261(x), r1=149(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=207(y), r7=56(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=83(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 149
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 207
LDI r7, 56
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 83
LDI r12, 0x000000
PSET r10, r11, r12
HALT
