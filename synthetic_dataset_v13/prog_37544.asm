; DESCRIPTION: Composite: Creates a cyan rectangular region at (365, 9) spanning 107 by 104 pixels then Creates a cyan circular shape at (368, 150) with radius 32 then Sets a single red pixel at (199, 11).
; PLAN: r0=365(x), r1=9(y), r2=107(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=150(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=199(x), r11=11(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 9
LDI r2, 107
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 150
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 199
LDI r11, 11
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
