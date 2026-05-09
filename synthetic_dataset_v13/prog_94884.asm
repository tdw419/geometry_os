; DESCRIPTION: Composite: Creates a yellow rectangular region at (252, 150) spanning 25 by 55 pixels then Creates a green circular shape at (186, 125) with radius 78 then Sets a single cyan pixel at (116, 76).
; PLAN: r0=252(x), r1=150(y), r2=25(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=125(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x), r11=76(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 150
LDI r2, 25
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 125
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 76
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
