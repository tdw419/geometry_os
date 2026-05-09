; DESCRIPTION: Composite: Creates a yellow circular shape at (105, 218) with radius 22 then Places a orange dot at position (141, 251) then Places a yellow 89x43 rectangle at position (181, 201).
; PLAN: r0=105(x), r1=218(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=251(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=201(y), r12=89(width), r13=43(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 218
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 251
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 181
LDI r11, 201
LDI r12, 89
LDI r13, 43
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
