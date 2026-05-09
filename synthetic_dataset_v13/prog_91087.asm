; DESCRIPTION: Composite: Creates a cyan rectangular region at (269, 64) spanning 99 by 43 pixels then Sets a single yellow pixel at (322, 110) then Draws a orange circle centered at (278, 98) with radius 69.
; PLAN: r0=269(x), r1=64(y), r2=99(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=110(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=98(y), r12=69(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 64
LDI r2, 99
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 110
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 278
LDI r11, 98
LDI r12, 69
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
