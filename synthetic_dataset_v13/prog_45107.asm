; DESCRIPTION: Composite: Creates a black rectangular region at (330, 114) spanning 105 by 16 pixels then Creates a purple circular shape at (373, 115) with radius 77 then Places a green dot at position (451, 130).
; PLAN: r0=330(x), r1=114(y), r2=105(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=115(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x), r11=130(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 114
LDI r2, 105
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 115
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 130
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
