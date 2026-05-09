; DESCRIPTION: Composite: Draws a green circle centered at (236, 143) with radius 52 then Creates a yellow rectangular region at (357, 75) spanning 55 by 106 pixels then Places a green dot at position (282, 218).
; PLAN: r0=236(x), r1=143(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=75(y), r7=55(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=282(x), r11=218(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 143
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 75
LDI r7, 55
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 282
LDI r11, 218
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
