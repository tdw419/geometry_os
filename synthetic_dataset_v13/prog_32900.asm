; DESCRIPTION: Composite: Creates a black circular shape at (134, 167) with radius 19 then Sets a single purple pixel at (144, 178) then Creates a black rectangular region at (355, 207) spanning 79 by 23 pixels.
; PLAN: r0=134(x), r1=167(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=178(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=207(y), r12=79(width), r13=23(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 167
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 178
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 355
LDI r11, 207
LDI r12, 79
LDI r13, 23
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
