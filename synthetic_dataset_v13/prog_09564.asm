; DESCRIPTION: Composite: Places a blue 89x55 rectangle at position (325, 132) then Sets a single orange pixel at (10, 69) then Creates a yellow circular shape at (185, 171) with radius 57.
; PLAN: r0=325(x), r1=132(y), r2=89(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=69(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=185(x), r11=171(y), r12=57(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 132
LDI r2, 89
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 69
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 185
LDI r11, 171
LDI r12, 57
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
