; DESCRIPTION: Composite: Creates a orange rectangular region at (190, 212) spanning 65 by 11 pixels then Sets a single green pixel at (128, 218) then Draws a yellow circle centered at (471, 57) with radius 26.
; PLAN: r0=190(x), r1=212(y), r2=65(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=218(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=471(x), r11=57(y), r12=26(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 212
LDI r2, 65
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 218
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 471
LDI r11, 57
LDI r12, 26
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
