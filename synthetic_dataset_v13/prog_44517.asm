; DESCRIPTION: Composite: Draws a cyan rectangle at (148, 45) with width 11 and height 107 then Creates a yellow circular shape at (179, 92) with radius 58 then Sets a single green pixel at (420, 222).
; PLAN: r0=148(x), r1=45(y), r2=11(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=92(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=420(x), r11=222(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 45
LDI r2, 11
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 92
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 420
LDI r11, 222
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
