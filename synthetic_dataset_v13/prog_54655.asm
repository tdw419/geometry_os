; DESCRIPTION: Composite: Places a black 69x60 rectangle at position (381, 191) then Places a yellow dot at position (299, 85) then Creates a purple circular shape at (86, 211) with radius 31.
; PLAN: r0=381(x), r1=191(y), r2=69(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=85(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=211(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 191
LDI r2, 69
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 85
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 86
LDI r11, 211
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
