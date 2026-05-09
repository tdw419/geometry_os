; DESCRIPTION: Composite: Places a orange 93x79 rectangle at position (21, 142) then Sets a single blue pixel at (76, 170) then Creates a yellow circular shape at (359, 170) with radius 52.
; PLAN: r0=21(x), r1=142(y), r2=93(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=170(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=359(x), r11=170(y), r12=52(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 142
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 170
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 359
LDI r11, 170
LDI r12, 52
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
