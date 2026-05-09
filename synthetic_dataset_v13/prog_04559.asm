; DESCRIPTION: Composite: Creates a cyan circular shape at (116, 89) with radius 61 then Sets a single purple pixel at (44, 104) then Creates a cyan rectangular region at (211, 14) spanning 30 by 106 pixels.
; PLAN: r0=116(x), r1=89(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=104(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=211(x), r11=14(y), r12=30(width), r13=106(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 89
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 104
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 211
LDI r11, 14
LDI r12, 30
LDI r13, 106
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
