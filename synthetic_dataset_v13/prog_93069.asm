; DESCRIPTION: Composite: Draws a magenta circle centered at (285, 110) with radius 43 then Creates a cyan rectangular region at (152, 170) spanning 99 by 49 pixels then Places a purple dot at position (379, 236).
; PLAN: r0=285(x), r1=110(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x), r6=170(y), r7=99(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=236(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 110
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 170
LDI r7, 99
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 236
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
