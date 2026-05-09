; DESCRIPTION: Composite: Places a orange circle of radius 48 at center (156, 197) then Creates a black rectangular region at (393, 3) spanning 114 by 105 pixels then Sets a single yellow pixel at (315, 227).
; PLAN: r0=156(x), r1=197(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x), r6=3(y), r7=114(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=227(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 197
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 3
LDI r7, 114
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 227
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
