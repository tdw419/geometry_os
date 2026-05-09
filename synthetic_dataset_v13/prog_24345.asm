; DESCRIPTION: Composite: Creates a orange rectangular region at (363, 90) spanning 89 by 75 pixels then Creates a yellow circular shape at (171, 88) with radius 32 then Places a cyan dot at position (143, 46).
; PLAN: r0=363(x), r1=90(y), r2=89(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=88(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=46(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 90
LDI r2, 89
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 88
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 46
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
