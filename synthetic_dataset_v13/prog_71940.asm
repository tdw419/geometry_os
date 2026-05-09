; DESCRIPTION: Composite: Places a orange circle of radius 22 at center (443, 184) then Creates a yellow rectangular region at (218, 151) spanning 15 by 57 pixels then Sets a single blue pixel at (137, 239).
; PLAN: r0=443(x), r1=184(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x), r6=151(y), r7=15(width), r8=57(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=239(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 443
LDI r1, 184
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 151
LDI r7, 15
LDI r8, 57
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 239
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
