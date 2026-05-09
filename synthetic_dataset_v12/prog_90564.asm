; DESCRIPTION: Composite: Places a blue 109x87 rectangle at position (142, 155) then Sets a single blue pixel at (205, 85) then Creates a yellow circular shape at (241, 83) with radius 48.
; PLAN: r0=142(x), r1=155(y), r2=109(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=85(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=241(x), r11=83(y), r12=48(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 155
LDI r2, 109
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 85
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 241
LDI r11, 83
LDI r12, 48
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
