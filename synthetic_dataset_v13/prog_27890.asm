; DESCRIPTION: Composite: Creates a yellow rectangular region at (412, 49) spanning 89 by 65 pixels then Places a purple dot at position (4, 29) then Creates a cyan circular shape at (77, 117) with radius 10.
; PLAN: r0=412(x), r1=49(y), r2=89(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=4(x), r6=29(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=117(y), r12=10(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 49
LDI r2, 89
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 29
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 77
LDI r11, 117
LDI r12, 10
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
