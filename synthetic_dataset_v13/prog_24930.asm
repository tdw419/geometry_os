; DESCRIPTION: Composite: Creates a magenta rectangular region at (199, 123) spanning 119 by 119 pixels then Creates a cyan circular shape at (446, 95) with radius 55 then Sets a single purple pixel at (265, 245).
; PLAN: r0=199(x), r1=123(y), r2=119(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=95(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x), r11=245(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 123
LDI r2, 119
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 95
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 245
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
