; DESCRIPTION: Composite: Places a yellow dot at position (438, 229) then Places a orange circle of radius 17 at center (285, 176) then Creates a red rectangular region at (439, 88) spanning 20 by 110 pixels.
; PLAN: r0=438(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=176(y), r7=17(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=88(y), r12=20(width), r13=110(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 285
LDI r6, 176
LDI r7, 17
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 88
LDI r12, 20
LDI r13, 110
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
