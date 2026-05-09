; DESCRIPTION: Composite: Places a black 33x15 rectangle at position (280, 48) then Places a black dot at position (226, 234) then Creates a purple circular shape at (236, 154) with radius 40.
; PLAN: r0=280(x), r1=48(y), r2=33(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=234(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=236(x), r11=154(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 48
LDI r2, 33
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 234
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 236
LDI r11, 154
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
