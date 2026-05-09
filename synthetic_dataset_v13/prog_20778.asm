; DESCRIPTION: Composite: Draws a black circle centered at (406, 97) with radius 45 then Sets a single yellow pixel at (264, 24) then Creates a cyan rectangular region at (30, 7) spanning 110 by 46 pixels.
; PLAN: r0=406(x), r1=97(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=24(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=30(x), r11=7(y), r12=110(width), r13=46(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 97
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 24
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 30
LDI r11, 7
LDI r12, 110
LDI r13, 46
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
