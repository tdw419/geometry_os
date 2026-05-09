; DESCRIPTION: Composite: Creates a black rectangular region at (414, 90) spanning 86 by 55 pixels then Creates a blue circular shape at (109, 90) with radius 62 then Places a red dot at position (318, 52).
; PLAN: r0=414(x), r1=90(y), r2=86(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=90(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=52(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 90
LDI r2, 86
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 90
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 52
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
