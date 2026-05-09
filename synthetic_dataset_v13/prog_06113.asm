; DESCRIPTION: Composite: Places a green 115x44 rectangle at position (245, 181) then Sets a single yellow pixel at (205, 127) then Creates a white circular shape at (259, 80) with radius 51.
; PLAN: r0=245(x), r1=181(y), r2=115(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=127(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=80(y), r12=51(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 245
LDI r1, 181
LDI r2, 115
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 127
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 259
LDI r11, 80
LDI r12, 51
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
